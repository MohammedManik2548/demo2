import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/details_page_bloc/details_page_state.dart';
import 'package:github_users/data/repositories/details_repository.dart';

import '../bloc/details_page_bloc/details_page_bloc.dart';
import '../bloc/details_page_bloc/details_page_event.dart';
import '../data/model/Items.dart';
import '../data/model/gitHub_rep_model/gitGub_rep_model.dart';
import '../utils/utils.dart';

class DetailsPage extends StatelessWidget {
  DetailsBloc detailsBloc;
  DetailsPage({super.key, required this.detailsBloc});
  static const routeName = 'details_page';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          DetailsBloc(detailsRepository: DetailsRepositoryImpl())
            ..add(FetchDetailsEvent()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Details Page',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: BlocBuilder<DetailsBloc, DetailsState>(
            builder: (context, state) {
              if (state is DetailLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DetailsLoaded) {
                return ListView.builder(
                    itemCount: state.gitHubRepoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    state.gitHubRepoList[index].owner!
                                            .avatarUrl ??
                                        '',
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    state.gitHubRepoList[index].name ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.gitHubRepoList[index].description ?? '',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        Utils.dateFormatDash(state.gitHubRepoList[index].createdAt ?? ''),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Container();
            },
          )),
    );
  }
}
