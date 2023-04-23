import 'package:dio_app/data/model/get_model.dart';
import 'package:dio_app/data/repo/get_repository.dart';
import 'package:dio_app/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/customwidget/network_aware_widget.dart';
import '../data/service/network_status_service.dart';

class GetPage extends StatefulWidget {
  const GetPage({Key? key}) : super(key: key);

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  List<GetModel> list = [];

  @override
  Widget build(BuildContext context) {
    return _buildParentUsingNetwork();
  }

  Widget _buildParentUsingNetwork() {
    return StreamProvider<NetworkStatus>(
      initialData: NetworkStatus.Online,
      create: (context) =>
          NetworkStatusService().networkStatusController.stream,
      child: NetworkAwareWidget(
        onlineChild: Container(
            child: Scaffold(
          appBar: AppBar(
            title: Text("Get Page"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProjectConstants.SECOND_SCREEN);
                },
                icon: Icon(Icons.next_plan_outlined),
              ),
            ],
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
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return _buildListContainer(index);
                        },
                        shrinkWrap: true,
                        primary: false,
                        itemCount: list.length,
                      ),
                    );
                  } else {
                    return Center(
                        child: Container(
                      child: CircularProgressIndicator(),
                    ));
                  }
                },
              )
            ],
          ),
        )),
        offlineChild: Container(
          child: Center(
            child: Text(
              "No internet connection!",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParent() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProjectConstants.SECOND_SCREEN);
            },
            icon: Icon(Icons.next_plan_outlined),
          ),
        ],
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
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _buildListContainer(index);
                    },
                    shrinkWrap: true,
                    primary: false,
                    itemCount: list.length,
                  ),
                );
              } else {
                return Center(
                    child: Container(child: CircularProgressIndicator()));
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
                      child: Text("${list[index].title}",
                      style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                      ),),
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
    list = (response?.data as List).map((x) => GetModel.fromJson(x)).toList();
    print("List length ${list.length}");
    return list;
  }
}
