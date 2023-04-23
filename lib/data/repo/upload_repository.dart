import 'package:flutter/cupertino.dart';

import '../provider/network_provider.dart';

class UploadRepository {
  uploadData(String url, String path, String fileName,
      ValueChanged<double> callback) async {
    try {
      NetworkProvider networkProvider = NetworkProvider();
      await networkProvider.uploadData(url, path, fileName, callback);
    } catch (e) {
      print(e);
    }
  }
}
