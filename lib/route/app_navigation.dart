import 'package:dio_app/presentation/get_page.dart';
import 'package:dio_app/presentation/patch_page.dart';
import 'package:dio_app/presentation/post_page.dart';
import 'package:dio_app/presentation/put_page.dart';
import 'package:dio_app/presentation/upload_page.dart';
import 'package:dio_app/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/download_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ProjectConstants.FIRST_SCREEN:
        return MaterialPageRoute(
            builder: (_) => GetPage());
      case ProjectConstants.SECOND_SCREEN:
        return MaterialPageRoute(
            builder: (_) => PostPage());
      case ProjectConstants.THIRD_SCREEN:
        return MaterialPageRoute(
            builder: (_) => PutPage());
      case ProjectConstants.FOURTH_SCREEN:
        return MaterialPageRoute(
            builder: (_) => PatchPage());
      case ProjectConstants.FIFTH_SCREEN:
        return MaterialPageRoute(
            builder: (_) => DownloadPage());
      case ProjectConstants.SIXTH_SCREEN:
        return MaterialPageRoute(
            builder: (_) => UploadPage());
      default:
        return null;
    }
  }
}