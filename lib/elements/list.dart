import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details_page_bloc/details_page_bloc.dart';
import '../data/model/Items.dart';
import '../ui/details_page.dart';

Widget buildList(List<Items> items){
  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context)=> DetailsPage(detailsBloc: BlocProvider.of<DetailsBloc>(context))));
          },
          child: ListTile(
            title: Text(items[index].title.toString()),
          ),
        );
      }
  );
}