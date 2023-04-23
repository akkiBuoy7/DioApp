import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_app/data/provider/network_helper.dart';
import 'package:dio_app/data/provider/network_logging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NetworkProvider {
  var dioClient = Dio()..interceptors.add(Logging());

  late Dio client;

  Future<bool> configureDioClient() async {
    if (await NetworkHelper.observeNetwork()) {
      client = Dio()..interceptors.add(Logging());
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "No internet",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);
      return false;
    }
  }

  Future<Response> getData(String _url) async {
    print("NETWORK RESULT >>> ${await NetworkHelper.observeNetwork()}");

    var response = await dioClient.get(_url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<Response?> postData(String _url, Map<String, dynamic> map) async {
    Response? response;
    if (await configureDioClient()) {
      response = await dioClient.post(_url, data: map);
      if (response.statusCode == 201) {
      } else {
        throw Exception("Failed to load");
      }
      return response;
    }
  }

  Future<Response?> putData(String _url, Map<String, dynamic> map) async {
    Response? response;

    if (await configureDioClient()) {
      response = await dioClient.put(_url, data: map);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to load");
      }
    }
  }

  Future<Response?> patchData(String _url, Map<String, dynamic> map) async {
    Response? response;

    if (await configureDioClient()) {
      response = await dioClient.patch(_url, data: map);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to load");
      }
    }
  }

  downloadData(String _url, String path, ValueChanged<double> callback) async {
    Response? response;

    if (await configureDioClient()) {
      var progress = 0.0;
      response = await dioClient.download(
        _url,
        path,
        onReceiveProgress: (recivedBytes, totalBytes) {
          progress = recivedBytes / totalBytes;
          // updating the progress in the UI
          callback(progress);
          print(progress);
        },
      );
      print(response.statusCode);
    }
  }

  uploadData(String _url, path, fileName, ValueChanged<double> callback) async {
    Response? response;

    if (await configureDioClient()) {
      var progress = 0.0;
      FormData data = FormData.fromMap({
        'x-api-key':
            'akash3404saha@gmail.com_3fea78457e15eb0694b12ea96268f9bb700244a499ac6f673636ae37db67e83024bae04a',
        'file': await MultipartFile.fromFile(path, filename: fileName)
      });

      response = await dioClient.post(
        _url,
        data: data,
        onSendProgress: (recivedBytes, totalBytes) {
          progress = recivedBytes / totalBytes;
          // updating the progress in the UI
          callback(progress);
          print(progress);
        },
      );
      print(response.statusCode);
    }
  }
}
