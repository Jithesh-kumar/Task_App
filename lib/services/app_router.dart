import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/recyle_bin.dart';
import 'package:flutter_task_app/screens/tabs_screen.dart';
//import 'package:flutter_task_app/screens/pending_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecyleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecyleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => TabsScreen(),
        );
      default:
        return null;
    }
  }
}
