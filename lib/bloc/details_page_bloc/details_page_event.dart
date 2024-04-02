import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable{}

class FetchDetailsEvent extends DetailsEvent{
  @override
  List<Object?> get props => [];

}