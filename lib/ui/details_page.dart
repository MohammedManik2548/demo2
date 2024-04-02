import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/details_page_bloc/details_page_state.dart';
import 'package:github_users/data/repositories/details_repository.dart';

import '../bloc/details_page_bloc/details_page_bloc.dart';
import '../bloc/details_page_bloc/details_page_event.dart';
import '../data/model/Items.dart';
import '../data/model/gitHub_rep_model/gitGub_rep_model.dart';

class DetailsPage extends StatelessWidget {
  DetailsBloc detailsBloc;
   DetailsPage({super.key, required this.detailsBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> DetailsBloc(detailsRepository: DetailsRepositoryImpl())..add(FetchDetailsEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
              'Details Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state){
            if(state is DetailLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is DetailsLoaded){
              return ListView.builder(
                itemCount: state.gitHubRepoList.length,
                  itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            state.gitHubRepoList[index].owner!.avatarUrl??''
                          ),
                        ),
                        title: Text(
                            state.gitHubRepoList[index].name??'',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        subtitle: Text(
                            state.gitHubRepoList[index].createdAt??'',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                    // return Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    //   child: Column(
                    //     children: [
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(25),
                    //         child: Container(
                    //           color: Colors.red,
                    //           child: Image.network(
                    //             state.gitHubRepoList[index].owner!.avatarUrl??'',
                    //             // height: 280,
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(height: 20),
                    //       Text(
                    //         state.gitHubRepoList[index].name.toString(),
                    //         style: TextStyle(
                    //             fontSize: 26,
                    //             fontWeight: FontWeight.w600
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  }
              );
            }
            return Container();
          },
        )
      ),
    );
  }
}
