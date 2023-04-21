import 'dart:convert';

import 'package:dio_app/data/model/get_model.dart';
import 'package:dio_app/data/model/patch_model.dart';
import 'package:dio_app/data/repo/patch_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/repo/get_repository.dart';
import '../util/utility.dart';

class PatchPage extends StatefulWidget {
  const PatchPage({Key? key}) : super(key: key);

  @override
  State<PatchPage> createState() => _PatchPageState();
}

class _PatchPageState extends State<PatchPage> {
  var _titleController = TextEditingController();
  var _bodyController = TextEditingController();
  GetModel? getModel;
  String? title = "";
  String? body = "";
  String? id = "";

  @override
  Widget build(BuildContext context) {
    return buildParent();
  }

  Widget buildParent() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Patch Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProjectConstants.FIFTH_SCREEN);
            },
            icon: Icon(Icons.next_plan_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _getData();
                },
                child: Text("Get")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "Enter title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(hintText: "Enter body"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _patchData();
                },
                child: Text("Patch")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "id: ${id} \n \n Title : ${title} \n \n Body: ${body}",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getData() async {
    String _url = "https://jsonplaceholder.typicode.com/posts/1";
    var response = await GetRepository().getData(_url);

    setState(() {
      getModel = GetModel.fromJson(json.decode(response.toString()));
      title = getModel?.title;
      body = getModel?.body!;
      id = getModel?.id.toString();
    });
  }

  _patchData() async {
    PatchModel model = PatchModel(
        title: _titleController.text.toString(),
        body: _bodyController.text.toString());

    final map = <String, dynamic>{};
    map['title'] = model.title;
    map['body'] = model.body;

    String _url = "https://jsonplaceholder.typicode.com/posts/1";
    var response = await PatchRepository().patchData(_url, map);

    setState(() {
      getModel = GetModel.fromJson(json.decode(response.toString()));
      title = getModel?.title;
      body = getModel?.body!;
      id = getModel?.id.toString();
    });
  }
}
