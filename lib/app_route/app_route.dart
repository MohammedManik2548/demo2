import 'package:flutter/material.dart';
import '../ui/details_page.dart';
import '../ui/my_home_page.dart';
class AppRoute{

  Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case MyHomePage.routeName:
        return MaterialPageRoute(
            builder: (_) => MyHomePage(),
        );
      case DetailsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => DetailsPage(),
        );
      default:
        return null;
      }
  }

}