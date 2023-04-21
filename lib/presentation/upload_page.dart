

import 'dart:io';

import 'package:dio_app/data/repo/upload_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../data/repo/download_repository.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String uploadingProgress = "";
  String fileName = "";
  String filePath = "";

  // callback method to update progress.
  void _update(double count) {
    setState(() {
      uploadingProgress = (count * 100).toInt().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _uploadData();
                },
                child: Text("Upload")),
            Text(
              "Uploading: $uploadingProgress%",
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _getFilePath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // type: FileType.custom,allowedExtensions: ['pdf']
    );



    if (result != null) {
      File file = File(result.files.single.path ?? "");
      fileName = file.path.split('/').last;
      filePath = file.path;
      return true;
    } else {
      // User canceled the picker
      return false;
    }
  }

  _uploadData() async {
    var repo = UploadRepository();
    String _url = "https://api.pdf.co/v1/file/upload";
    if(await _getFilePath()){
      await repo.uploadData(_url,filePath,fileName,_update);
    }
  }
}
