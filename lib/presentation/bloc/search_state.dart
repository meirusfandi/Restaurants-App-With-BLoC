part of 'search_bloc.dart';

class SearchState extends Equatable {
  final SearchRecipeEntity? searchRecipeEntity;
  final String errorMessage;
  final bool isloading;

  const SearchState({
    this.searchRecipeEntity,
    this.errorMessage = '',
    this.isloading = false
  });

  const SearchState.noValue()
      : searchRecipeEntity = null,
        isloading = true,
        errorMessage = '';

  SearchState copyWith({
    SearchRecipeEntity? searchRecipeEntity,
    bool? isloading,
    String? errorMessage
  }) {
    return SearchState(
        searchRecipeEntity: searchRecipeEntity ?? this.searchRecipeEntity,
        isloading: isloading ?? this.isloading,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [
    isloading,
    errorMessage,
    searchRecipeEntity ?? const SearchRecipeEntity(error: false, restaurants: [], founded: 0),
  ];

}