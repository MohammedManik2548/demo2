import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/git_user_bloc/git_user_state.dart';
import 'package:github_users/data/repositories/git_user_repository.dart';
import 'package:github_users/widget/my_drawer.dart';
import '../bloc/details_page_bloc/details_page_bloc.dart';
import '../bloc/git_user_bloc/git_user_bloc.dart';
import '../bloc/git_user_bloc/git_user_event.dart';
import '../data/model/Items.dart';
import '../widget/error.dart';
import '../widget/loading.dart';
import 'details_page.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatelessWidget {

  final scrollController = ScrollController();
  int currentMax =10;//

  static const routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    // setupScrollController(context);
    return BlocProvider(
      create: (context) => GitUserBloc(gitUserRepository: GitUserRepositoryImpl())..add(FetchGitUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
              'GitHub User',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
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
              return _buildList(context,state.items);
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


  Widget _buildList(BuildContext context,List<Items> items){
    // items = List.generate(10, (i) => items[i]);
    items = List.generate(10, (index) => items[index]);

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        for(int i =currentMax; i<currentMax+10; i++){
                  items.add(items[i]);
        }
                currentMax = currentMax +10;
        print('call');
        // BlocProvider.of<GitUserBloc>(context).gitUserRepository.getGitUsers();
      }else{
        print("Don't call");
      }
    });
    // int currentMax =11;
    //
    //       for(int i =currentMax; i<currentMax+12; i++){
    //         items.add(items[i]);
    //       }
    //       currentMax = currentMax +12;
    return ListView.builder(
        controller: scrollController,
        itemExtent: 70,
        itemCount: items.length+1,
        itemBuilder: (context, index){
          if(index == items.length){
            return buildLoading();
          }
          return InkWell(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context)=> DetailsPage(detailsBloc: BlocProvider.of<DetailsBloc>(context))));
            },
            child: ListTile(
              leading: Text('${index+1}'),
              title: Text(items[index].title.toString()),
            ),
          );
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
  }

}
