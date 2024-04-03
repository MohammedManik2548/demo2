import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details_page_bloc/details_page_bloc.dart';
import '../ui/details_page.dart';
import '../ui/my_home_page.dart';
class AppRoute{

  Route? onGenerateRoute(BuildContext context,RouteSettings routeSettings){
    switch(routeSettings.name){
      case MyHomePage.routeName:
        return MaterialPageRoute(
            builder: (_) => MyHomePage(),
        );
      case DetailsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => DetailsPage(detailsBloc: BlocProvider.of<DetailsBloc>(context)),
        );
      default:
        return null;
      }
  }

}