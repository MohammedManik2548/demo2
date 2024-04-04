import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/git_user_bloc/git_user_event.dart';
import 'package:github_users/bloc/git_user_bloc/git_user_state.dart';
import 'package:github_users/data/model/Items.dart';
import '../../data/repositories/git_user_repository.dart';

class GitUserBloc extends Bloc<GitUserEvent, GitUserState>{
  GitUserRepository gitUserRepository;
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;

  GitUserBloc(this.gitUserRepository) : super(GitUserInitialState(null)){

    scrollController.addListener(() {
      add(FetchGitUserMoreEvent());
    });

    on<FetchGitUserEvent>((event, emit)async{
      emit(GitUserLoadingState(null));
      try{
        var items = await gitUserRepository.getGitUsers(page);
        emit(GitUserLoadedState(items: items));
      }catch(e){
        print(e);
        // emit(GitUserErrorState(message: e.toString()));
      }

    });

    on<FetchGitUserMoreEvent>((event, emit)async{

      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isLoadingMore = true;
        page++;
        var items = await gitUserRepository.getGitUsers(page);
        emit(GitUserLoadedState(items: [...state.items, ...items]));
      }

    });

  }

}