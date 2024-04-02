import 'package:equatable/equatable.dart';

import '../../data/model/gitHub_rep_model/gitGub_rep_model.dart';

abstract class DetailsState extends Equatable{}

class DetailLoading extends DetailsState{
  @override
  List<Object?> get props => [];

}

class DetailsLoaded extends DetailsState{
  late final List<GitHubRepoModel> gitHubRepoList;
  DetailsLoaded({required this.gitHubRepoList});

  @override
  List<Object?> get props => [];

}

class DetailsError extends DetailsState{
  late String message;
  DetailsError({required this.message});


  @override
  List<Object?> get props => [];

}