part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ListRecipeEntity? listRecipeEntity;
  final String errorMessage;
  final bool isloading;

  const HomeState({
    this.listRecipeEntity,
    this.errorMessage = '',
    this.isloading = false
  });

  const HomeState.noValue()
      : listRecipeEntity = null,
        isloading = true,
        errorMessage = '';

  HomeState copyWith({
    ListRecipeEntity? listRecipeEntity,
    bool? isloading,
    String? errorMessage
  }) {
    return HomeState(
        listRecipeEntity: listRecipeEntity ?? this.listRecipeEntity,
        isloading: isloading ?? this.isloading,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }
  
  @override
  List<Object?> get props => [
    isloading,
    errorMessage,
    listRecipeEntity ?? const ListRecipeEntity(error: false, message: '', count: 0, restaurants: [])
  ];

}