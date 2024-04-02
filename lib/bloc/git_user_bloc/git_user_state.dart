import 'package:equatable/equatable.dart';

import '../../data/model/Items.dart';

abstract class GitUserState extends Equatable{}

class GitUserInitialState extends GitUserState{
  @override
  List<Object?> get props => [];
}

class GitUserLoadingState extends GitUserState{
  @override
  List<Object?> get props => [];
}

class GitUserLoadedState extends GitUserState{
  late final List<Items> items;
  GitUserLoadedState({required this.items});

  @override
  List<Object?> get props => [];
}

class GitUserErrorState extends GitUserState{
  late final String message;
  GitUserErrorState({required this.message});


  @override
  List<Object?> get props => [];

}