import 'package:dio/dio.dart';

class NetworkProvider{

  var dioClient = Dio();

  Future<Response> getData(String _url) async{
    var response = await dioClient.get(_url);
    if(response.statusCode==200){
      return response;
    }else{
     throw Exception("Failed to load");
    }
  }
}