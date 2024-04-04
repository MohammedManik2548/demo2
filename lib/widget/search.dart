import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc/search_bloc.dart';
import '../bloc/search_bloc/search_event.dart';
import '../bloc/search_bloc/search_state.dart';

class ItemSearch extends SearchDelegate<List>{
  late SearchBloc searchBloc;
  ItemSearch({required this.searchBloc});
  String? queryString;
  int? page;

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
              itemCount: state.items.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("$index"),
                    ),
                    title: Text(state.items[index].id.toString()),
                    subtitle: Text(state.items[index].title.toString()),
                  ),
                );
              }
          );
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