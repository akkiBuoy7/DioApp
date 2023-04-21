import 'package:flutter/cupertino.dart';

import '../provider/network_provider.dart';

class UploadRepository{
  uploadData(String url,String path,String fileName,ValueChanged<double> callback) async{
    NetworkProvider networkProvider = NetworkProvider();
    await networkProvider.uploadData(url,path,fileName,callback);
  }
}