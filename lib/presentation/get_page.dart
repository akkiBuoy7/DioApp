import 'package:dio_app/data/model/get_model.dart';
import 'package:dio_app/data/repo/get_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  List<GetModel> list = [];

  @override
  Widget build(BuildContext context) {
    return _buildParent();
  }

  Widget _buildParent() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Page"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                width: 100,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      _getData();
                    },
                    child: Text("Get Data"))),
          ),
          FutureBuilder(
            future: _getData(),
            builder: (context, data) {
              if (data.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildListContainer(index);
                  },
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 2,
                );
              } else {
                return Center(
                    child: Container(
                  child: Text("Some error"),
                ));
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildListContainer(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            child: Column(
              children: [
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${list[index].title}"),
                    )
                  ],
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${list[index].body}"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<GetModel>> _getData() async {
    String _url = "https://jsonplaceholder.typicode.com/posts";
    var response = await GetRepository().getData(_url);
    list = (response.data as List).map((x) => GetModel.fromJson(x)).toList();
    print("List length ${list.length}");
    return list;
  }
}
