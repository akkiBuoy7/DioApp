
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../provider/network_provider.dart';

class DownloadRepository{
  downloadData(String url,String path,ValueChanged<double> callback) async{
    try{
      NetworkProvider networkProvider = NetworkProvider();
      await networkProvider.downloadData(url,path,callback);
    }catch(e){
      print(e);
    }
  }
}