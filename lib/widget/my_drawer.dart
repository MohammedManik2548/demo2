import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../ui/details_page.dart';
import '../ui/my_home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                color: Colors.white,
              ),
              Positioned(
                top: 30,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(180),
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: Image.network(
                            'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                        'Mr Jon',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(MyHomePage.routeName),
            child: ListTile(
              title: Text('Home Page'),
            ),
          ),
          // Divider(color: Colors.grey),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(DetailsPage.routeName),
            child: ListTile(
              title: Text('Details Page'),
            ),
          ),
        ],
      ),
    );
  }
}
