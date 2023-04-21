
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../data/repo/download_repository.dart';
import '../util/utility.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String downloadingprogress = "";
  String fileName = "file1.txt";

  // callback method to update progress.
  void _update(double count) {
    setState(() {
      downloadingprogress = (count * 100).toInt().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProjectConstants.SIXTH_SCREEN);
            },
            icon: Icon(Icons.next_plan_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _downloadData();
                },
                child: Text("Download")),
            Text(
              "Downloading: $downloadingprogress%",
            )
          ],
        ),
      ),
    );
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  _downloadData() async {
    var repo = DownloadRepository();
    String _url = "https://www.ssa.gov/oact/babynames/names.zip";
    String path = await _getFilePath(fileName);
    await repo.downloadData(_url, path,_update);
  }
}
