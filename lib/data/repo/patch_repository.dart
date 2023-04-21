import 'package:dio/dio.dart';

import '../provider/network_provider.dart';

class PatchRepository{
  Future<Response?>patchData(String url,Map<String, dynamic> map) async{
    NetworkProvider networkProvider = NetworkProvider();
    var jsonResponse = await networkProvider.patchData(url,map);
    return jsonResponse;
  }
}