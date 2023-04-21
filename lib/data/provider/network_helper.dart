import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {

  // This function fires the Network Notify events
   static bool observeNetwork() {
     bool resultType = false;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // Firing event
        resultType =  false;// default value is false
      } else {
        resultType =  true; // make the boolean true
      }
    });

    return resultType;
  }
}