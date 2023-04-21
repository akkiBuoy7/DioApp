import 'package:dio/dio.dart';

import '../provider/network_provider.dart';

class PutRepository{

  Future<Response?>putData(String url,Map<String, dynamic> map) async{
    NetworkProvider networkProvider = NetworkProvider();
    var jsonResponse = await networkProvider.putData(url,map);
    return jsonResponse;
  }
}