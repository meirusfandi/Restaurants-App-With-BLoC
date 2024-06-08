part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => <HomeEvent>[];
}

class GetRecipeEvent extends HomeEvent {
  const GetRecipeEvent();

  @override
  List<Object> get props => <Object>[];
}