import 'dart:convert';

import 'package:dio_app/data/model/put_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/post_response.dart';
import '../data/model/put_model.dart';
import '../data/repo/put_repository.dart';
import '../util/utility.dart';

class PutPage extends StatefulWidget {
  const PutPage({Key? key}) : super(key: key);

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  PutResponse? responseModel;

  @override
  Widget build(BuildContext context) {
    return buildParent();
  }

  Widget buildParent() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Put Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProjectConstants.FOURTH_SCREEN);
            },
            icon: Icon(Icons.next_plan_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "Enter name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter email"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _putData();
                },
                child: Text("Put")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Name : ${responseModel?.name} Email: ${responseModel?.eamil}",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  _putData() async {
    PutModel model = PutModel(
        name: _nameController.text.toString(),
        email: _emailController.text.toString());

    final map = <String, dynamic>{};
    map['name'] = model.name;
    map['email'] = model.email;

    String _url = "https://jsonplaceholder.typicode.com/posts/1";
    var response = await PutRepository().putData(_url, map);

    if (response != null) {
      setState(() {
        responseModel = PutResponse.fromJson(json.decode(response.toString()));
      });
    }
  }
}
