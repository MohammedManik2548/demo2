
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/search_bloc/search_event.dart';
import 'package:github_users/bloc/search_bloc/search_state.dart';

import '../../data/model/Items.dart';
import '../../data/repositories/search_repository.dart';
import '../git_user_bloc/git_user_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final SearchRepository searchRepository;
  int page = 1;
  // String query = 'flutter';
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  SearchBloc({required this.searchRepository}) : super(SearchLoading()){

    scrollController.addListener(() {
      add(FetchSearchMoreEvent(query: ''));
    });

    on<FetchSearchEvent>((event, emit) async{
      emit(SearchLoading());

      try{

        List<Items> items = await searchRepository.searchRepo(event.query,page);
        emit(SearchLoaded(items: items));

      }catch(e, l){
        emit(SearchError());
        print(l);
      }

    });

    on<FetchSearchMoreEvent>((event, emit)async{

      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isLoadingMore = true;
        page++;
        List<Items> items = await searchRepository.searchRepo(event.query,page);
        emit(SearchLoaded(items: [...items]));
      }

    });

  }

}