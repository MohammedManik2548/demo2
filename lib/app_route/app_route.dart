import 'package:flutter/material.dart';
import '../ui/details_page.dart';
import '../ui/my_home_page.dart';
class AppRoute{

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case MyHomePage.routeName:
        return _materialRoute(MyHomePage());
      case DetailsPage.routeName:
        return _materialRoute(DetailsPage());
      default:
        return _materialRoute(Scaffold(body: Center(child: Text('No page Found'),),));
      }
  }

  static Route _materialRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_)=>view,

    );
  }

}