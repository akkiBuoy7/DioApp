import 'package:dio/dio.dart';

import '../provider/network_provider.dart';

class PostRepository{

  Future<Response?>postData(String url,Map<String, dynamic> map) async{
    try{
      NetworkProvider networkProvider = NetworkProvider();
      var jsonResponse = await networkProvider.postData(url,map);
      return jsonResponse;
    }catch(e){
      throw e;
    }
  }
}