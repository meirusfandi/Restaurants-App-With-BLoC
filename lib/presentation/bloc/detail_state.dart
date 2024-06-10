part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final DetailRecipeEntity? detailRecipeEntity;
  final String errorMessage;
  final bool isloading;

  const DetailState({
    this.detailRecipeEntity,
    this.errorMessage = '',
    this.isloading = false
  });

  const DetailState.noValue()
      : detailRecipeEntity = null,
        isloading = true,
        errorMessage = '';

  DetailState copyWith({
    DetailRecipeEntity? detailRecipeEntity,
    bool? isloading,
    String? errorMessage
  }) {
    return DetailState(
        detailRecipeEntity: detailRecipeEntity ?? this.detailRecipeEntity,
        isloading: isloading ?? this.isloading,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }
  
  @override
  List<Object?> get props => [
    isloading,
    errorMessage,
    detailRecipeEntity ?? const DetailRecipeEntity(
      error: false,
      message: '',
      restaurant: DetailRecipeDataEntity(
          id: "",
          name: "",
          description: "",
          city: "",
          address: "",
          pictureId: "",
          rating: 0.0,
          categories: [],
          menus: MenuEntity(foods: [], drinks: []),
          customerReviews: []
      )
    )
  ];

}