import 'package:dio/dio.dart';
import 'package:dio_app/data/provider/network_helper.dart';
import 'package:dio_app/data/provider/network_logging.dart';
import 'package:flutter/cupertino.dart';

import '../service/network_status_service.dart';

class NetworkProvider {

  var dioClient = Dio()..interceptors.add(Logging());


  // void configureDio(){
  //
  //   NetworkStatusService().networkStatusController.stream
  //
  //   if(NetworkHelper.observeNetwork()){
  //   }else{
  //     throw Exception("No Internet Connection");
  //   }
  // }

  Future<Response> getData(String _url) async {
    var response = await dioClient.get(_url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<Response> postData(String _url, Map<String, dynamic> map) async {
    var response = await dioClient.post(_url, data: map);
    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<Response> putData(String _url, Map<String, dynamic> map) async {
    var response = await dioClient.put(_url, data: map);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<Response> patchData(String _url, Map<String, dynamic> map) async {
    var response = await dioClient.patch(_url, data: map);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load");
    }
  }

  downloadData(String _url, String path, ValueChanged<double> callback) async{
    var progress = 0.0;
    var response = await dioClient.download(
      _url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes){
        progress = recivedBytes / totalBytes;
        // updating the progress in the UI
        callback(progress);
        print(progress);
      },
    );
    print(response.statusCode);
  }

  uploadData(String _url,path,fileName,ValueChanged<double> callback) async{
    var progress = 0.0;
    FormData data = FormData.fromMap(
      {'x-api-key':'akash3404saha@gmail.com_3fea78457e15eb0694b12ea96268f9bb700244a499ac6f673636ae37db67e83024bae04a',
      'file': await MultipartFile.fromFile(path,filename: fileName)}
    );

    var response = await dioClient.post(
      _url,
      data: data,
      onSendProgress: (recivedBytes, totalBytes){
        progress = recivedBytes / totalBytes;
        // updating the progress in the UI
        callback(progress);
        print(progress);
      },
    );
    print(response.statusCode);
  }
}
