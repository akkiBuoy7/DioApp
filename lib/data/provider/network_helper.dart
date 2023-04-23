import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {
  static bool  resultType = false;
  // This function fires the Network Notify events
   static Future<bool> observeNetwork() async{
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.none) {
       // Firing event
       resultType =  false;// default value is false
     } else if(connectivityResult == ConnectivityResult.mobile){
       // make the boolean true
     }else if(connectivityResult == ConnectivityResult.wifi){
       resultType =  true;
     }
    return resultType;
  }
}