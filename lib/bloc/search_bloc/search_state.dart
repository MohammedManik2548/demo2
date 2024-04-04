
import 'package:equatable/equatable.dart';

import '../../data/model/Items.dart';

abstract class SearchState extends Equatable{}

class SearchLoading extends SearchState{
  @override
  List<Object?> get props => [];

}

class SearchLoaded extends SearchState{
  late final List<Items> items;
  SearchLoaded({required this.items});
  @override
  List<Object?> get props => [];

}

class SearchError extends SearchState{
  @override
  List<Object?> get props => [];

}