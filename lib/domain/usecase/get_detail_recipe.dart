import 'package:equatable/equatable.dart';
import 'package:recipe_app_bloc/core/utils/usecase.dart';
import 'package:recipe_app_bloc/domain/entity/detail_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';

class GetDetailRecipe extends  UseCase<DetailRecipeEntity, DetailParams> {
  final RecipeRepository _repository;
  GetDetailRecipe(this._repository);

  @override
  Future<DetailRecipeEntity> call(DetailParams params) async {
    final result = await _repository.detailRecipe(params.id);
    return DetailRecipeEntity(
      error: result.error ?? false, 
      message: result.message ?? '',
      restaurant: DetailRecipeDataEntity(
        id: result.restaurant?.id ?? '', 
        name: result.restaurant?.name ?? '', 
        description: result.restaurant?.description ?? '', 
        city: result.restaurant?.city ?? '', 
        address: result.restaurant?.address ?? '', 
        pictureId: result.restaurant?.pictureId ?? '', 
        rating: result.restaurant?.rating ?? 0.0, 
        categories: result.restaurant?.categories?.map((e) => NameEntity(name: e.name ?? '')).toList() ?? [], 
        menus: MenuEntity(
          foods: result.restaurant?.menus?.foods?.map((e) => NameEntity(name: e.name ?? '')).toList() ?? [], 
          drinks: result.restaurant?.menus?.drinks?.map((e) => NameEntity(name: e.name ?? '')).toList() ?? [],
        ), 
        customerReviews: result.restaurant?.customerReviews?.map((e) => CustReviewEntity(name: e.name ?? '', review: e.review ?? '', date: e.date ?? '')).toList() ?? []
      )
    );
  }
}

class DetailParams extends Equatable {
  final String id;

  const DetailParams({required this.id});
  
  @override
  List<Object?> get props => [id];
}