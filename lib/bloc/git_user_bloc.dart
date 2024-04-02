import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/git_user_event.dart';
import 'package:github_users/bloc/git_user_state.dart';
import 'package:github_users/data/model/Items.dart';
import '../data/repositories/git_user_repository.dart';

class GitUserBloc extends Bloc<GitUserEvent, GitUserState>{
  final GitUserRepository gitUserRepository;

  GitUserBloc({required this.gitUserRepository}):super(GitUserLoadingState()){

    on<FetchGitUserEvent>((event, emit)async{
      emit(GitUserLoadingState());
      try{
        List<Items> items = await gitUserRepository.getGitUsers();
        emit(GitUserLoadedState(items: items));
      }catch(e){
        emit(GitUserErrorState(message: e.toString()));
      }

    });
  }

}