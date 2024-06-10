part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => <SearchEvent>[];
}

class SearchRecipeEvent extends SearchEvent {
  final String query;
  const SearchRecipeEvent({required this.query});

  @override
  List<Object> get props => <Object>[query];
}
