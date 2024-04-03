import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/git_user_bloc/git_user_event.dart';
import 'package:github_users/bloc/git_user_bloc/git_user_state.dart';
import 'package:github_users/data/model/Items.dart';
import '../../data/repositories/git_user_repository.dart';

class GitUserBloc extends Bloc<GitUserEvent, GitUserState>{
  final GitUserRepository gitUserRepository;
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  GitUserBloc({required this.gitUserRepository}):super(GitUserLoadingState()){

    scrollController.addListener(() {
      add(FetchGitUserMoreEvent());
    });

    on<FetchGitUserEvent>((event, emit)async{
      emit(GitUserLoadingState());
      try{
        List<Items> items = await gitUserRepository.getGitUsers();
        items = List.generate(13, (index) => items[index]);
        emit(GitUserLoadedState(items: items));
      }catch(e){
        emit(GitUserErrorState(message: e.toString()));
      }

    });

    on<FetchGitUserMoreEvent>((event, emit)async{

      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isLoadingMore = true;
        List<Items> items = await gitUserRepository.getGitUsers();
        emit(GitUserLoadedState(items: items));
      }

    });

  }

}