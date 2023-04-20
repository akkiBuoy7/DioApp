import 'package:dio/dio.dart';
import 'package:dio_app/data/provider/network_provider.dart';

import '../model/get_model.dart';

class GetRepository{

  Future<Response>getData(String url) async{
    NetworkProvider networkProvider = NetworkProvider();
    var jsonResponse = await networkProvider.getData(url);
    print("Raw response >>>>>>>>> \n ${jsonResponse.toString()}");
    // GetModel getModel = GetModel.fromJson(jsonResponse);
    return jsonResponse;
  }
}