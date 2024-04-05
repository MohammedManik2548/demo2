import 'package:equatable/equatable.dart';

import '../git_user_bloc/git_user_event.dart';

abstract class SearchEvent extends Equatable{}

class FetchSearchEvent extends SearchEvent{

  late final String query;
  FetchSearchEvent({required this.query});

  @override
  List<Object?> get props => [];

}

class FetchSearchMoreEvent extends SearchEvent{
  late final String query;
  FetchSearchMoreEvent({required this.query});
  @override
  List<Object?> get props => [];
}