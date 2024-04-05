import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc/search_bloc.dart';
import '../bloc/search_bloc/search_event.dart';
import '../bloc/search_bloc/search_state.dart';
import '../data/repositories/search_repository.dart';
import 'loading.dart';

class ItemSearch extends SearchDelegate<List>{
  late SearchBloc searchBloc;
  ItemSearch({required this.searchBloc});
  String? queryString;
  // int? page;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, []);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(FetchSearchEvent(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return const Center(
            child: Text('Data Not Found'),
          );
        }
        if (state is SearchLoaded) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              controller: context.read<SearchBloc>().scrollController,
              itemExtent: 80,
              itemCount: context.read<SearchBloc>().isLoadingMore
                  ? state.items.length + 1 : state.items.length,
              itemBuilder: (context, index){
                if(index >= state.items.length){
                  return buildLoading();
                }else{
                  var item = state.items[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(item.id.toString()),
                      subtitle: Text(item.title.toString()),
                    ),
                  );
                }
                // return InkWell(
                //   onTap: (){
                //     Navigator.push(
                //         context, MaterialPageRoute(builder: (context)=> DetailsPage(detailsBloc: BlocProvider.of<DetailsBloc>(context))));
                //   },
                //   child: ListTile(
                //     leading: Text('${index+1}'),
                //     title: Text(items[index].title.toString()),
                //   ),
                // );
                // if(index < items.length-1){
                //   return InkWell(
                //     onTap: (){
                //       Navigator.push(
                //           context, MaterialPageRoute(builder: (context)=> DetailsPage(detailsBloc: BlocProvider.of<DetailsBloc>(context))));
                //     },
                //     child: ListTile(
                //       leading: Text('${index+1}'),
                //       title: Text(items[index].title.toString()),
                //     ),
                //   );
                // }else{
                //   return Center(
                //     child: buildLoading(),
                //   );
                // }

              }
          );
          // return ListView.builder(
          //     controller: context.read<SearchBloc>().scrollController,
          //     itemExtent: 80,
          //     itemCount: state.items.length,
          //     itemBuilder: (context, index){
          //       return Card(
          //         child: ListTile(
          //           leading: CircleAvatar(
          //             child: Text("$index"),
          //           ),
          //           title: Text(state.items[index].id.toString()),
          //           subtitle: Text(state.items[index].title.toString()),
          //         ),
          //       );
          //     }
          // );
        }
        return const Scaffold();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}