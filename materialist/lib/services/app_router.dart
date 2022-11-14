import 'package:flutter/material.dart';
import 'package:materialist/models/myuser.dart';
import 'package:materialist/services/auth.dart';
import 'package:provider/provider.dart';
import '../screens/recycle_bin.dart';
import '../screens/tabs_screen.dart';
import '../screens/home/user_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) {
          return const RecycleBin();
        });
      case TabsScreen.id:
        return MaterialPageRoute(builder: (context) {
          return const TabsScreen();
        });
      case Home.id:
        return MaterialPageRoute(builder: (context) {
          return Home();
        });
      default:
        return null;
    }
  }
}
