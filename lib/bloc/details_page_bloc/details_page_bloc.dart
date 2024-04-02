import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/bloc/details_page_bloc/details_page_event.dart';
import 'package:github_users/bloc/details_page_bloc/details_page_state.dart';
import 'package:github_users/data/repositories/details_repository.dart';

import '../../data/model/gitHub_rep_model/gitGub_rep_model.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState>{
  final DetailsRepository detailsRepository;

  DetailsBloc({required this.detailsRepository}):super(DetailLoading()){
    on<FetchDetailsEvent>((event, emit)async{
      emit(DetailLoading());

      try{

        List<GitHubRepoModel> repositoryList = await detailsRepository.getGitRepository();
        emit(DetailsLoaded(gitHubRepoList: repositoryList));

      }catch(e, l){
        print(e);
        print(l);
        emit(DetailsError(message: e.toString()));
      }

    });
  }

}