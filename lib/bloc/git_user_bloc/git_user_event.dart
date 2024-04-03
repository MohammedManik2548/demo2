import 'package:equatable/equatable.dart';

abstract class GitUserEvent extends Equatable{}

class FetchGitUserEvent extends GitUserEvent{
  @override
  List<Object?> get props => [];

}
class FetchGitUserMoreEvent extends GitUserEvent{
  @override
  List<Object?> get props => [];

}