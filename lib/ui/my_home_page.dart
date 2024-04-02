import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/git_user_bloc.dart';
import 'package:github_users/bloc/git_user_event.dart';
import 'package:github_users/bloc/git_user_state.dart';
import 'package:github_users/data/repositories/git_user_repository.dart';
import 'package:github_users/elements/error.dart';
import 'package:github_users/elements/loading.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GitUserBloc(gitUserRepository: GitUserRepositoryImpl())..add(FetchGitUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('GitHub User'),
        ),
        body: BlocBuilder<GitUserBloc, GitUserState>(
          builder: (context, state){
            if(state is GitUserInitialState){
              print('initial state');
              return buildLoading();
            }else if(state is GitUserLoadingState){
              print('loading state');
              return buildLoading();
            }else if(state is GitUserLoadedState){
              print('loaded state');
              return ListView.builder(
                itemCount: state.items.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(state.items[index].title.toString()),
                    );
                  }
              );
            }else if(state is GitUserErrorState){
              print('error state');
              return buildError(state.message);
            }
            return Container(child: Text('Manik'),);
          },
        ),
      ),
    );
  }
}
