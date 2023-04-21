import 'dart:convert';

import 'package:dio_app/data/model/Post_model.dart';
import 'package:dio_app/data/model/post_response.dart';
import 'package:dio_app/data/repo/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/utility.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  String _reponseId = "";

  @override
  Widget build(BuildContext context) {
    return buildParent();
  }

  Widget buildParent() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post Page"),
        actions: [
          IconButton(
            onPressed: () {

              Navigator.pushNamed(context, ProjectConstants.THIRD_SCREEN);
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
            ElevatedButton(onPressed: () {
              _postData();
            }, child: Text("Post")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Response : ${_reponseId}",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  _postData() async {

    PostModel model = PostModel(name: _nameController.text.toString(),
    email: _emailController.text.toString());

    final map = <String, dynamic>{};
    map['name'] = model.name;
    map['email'] = model.email;

    String _url = "https://jsonplaceholder.typicode.com/posts";
    var response = await PostRepository().postData(_url,map);
    var item = PostResponse.fromJson(json.decode(response.toString()));
    setState(() {
      _reponseId = item.id.toString();
    });
  }
}
