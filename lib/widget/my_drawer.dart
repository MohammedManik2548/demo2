import 'package:flutter/material.dart';

import '../ui/details_page.dart';
import '../ui/my_home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.purple,

          ),
          SizedBox(height: 10),
          InkWell(
            onTap: ()=> Navigator.of(context).pushNamed(MyHomePage.routeName),
            child: ListTile(
              title: Text('Home Page'),
            ),
          ),
          InkWell(
            onTap: ()=> Navigator.of(context).pushNamed(DetailsPage.routeName),
            child: ListTile(
              title: Text('Details Page'),
            ),
          ),
        ],
      ),
    );
  }
}
