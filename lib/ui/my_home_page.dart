import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/git_user_bloc/git_user_state.dart';
import 'package:github_users/data/repositories/git_user_repository.dart';
import 'package:github_users/widget/my_drawer.dart';
import '../bloc/details_page_bloc/details_page_bloc.dart';
import '../bloc/git_user_bloc/git_user_bloc.dart';
import '../bloc/git_user_bloc/git_user_event.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../data/model/Items.dart';
import '../widget/error.dart';
import '../widget/loading.dart';
import '../widget/search.dart';
import 'details_page.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatelessWidget {

  // final scrollController = ScrollController();
  int currentMax =10;//

  static const routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    // setupScrollController(context);
    return RepositoryProvider(
      create: (context)=> GitUserRepository(),
      child: BlocProvider(
        create: (context) => GitUserBloc(context.read<GitUserRepository>())..add(FetchGitUserEvent()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: (){
                    showSearch(
                        context: context,
                        delegate: ItemSearch(
                            searchBloc: BlocProvider.of<SearchBloc>(context)));
                  },
                  icon: Icon(Icons.search,color: Colors.white,),
              ),
            ],
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
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }


  Widget _buildList(BuildContext context,List items){
    return ListView.builder(
        controller: context.read<GitUserBloc>().scrollController,
        itemExtent: 80,
        itemCount: context.read<GitUserBloc>().isLoadingMore
        ? items.length + 1 : items.length,
        itemBuilder: (context, index){
          if(index >= items.length){
            return buildLoading();
          }else{
            var item = items[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("$index"),
                ),
                title: Text(item['id'].toString()),
                subtitle: Text(item['title'].toString()),
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
  }
}
