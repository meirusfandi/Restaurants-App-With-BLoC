import 'package:recipe_app_bloc/core/utils/usecase.dart';
import 'package:recipe_app_bloc/domain/entity/list_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';

class GetListRecipe extends  UseCaseNoParam<ListRecipeEntity> {
  final RecipeRepository _repository;
  GetListRecipe(this._repository);

  @override
  Future<ListRecipeEntity> call() async {
    final result = await _repository.getListData();
    return ListRecipeEntity(
      error: result.error ?? false, 
      message: result.message ?? '',
      count: result.count ?? 0,
      restaurants: result.restaurants?.map((e) {
        return RecipeDataEntity(id: e.id ?? '', name: e.name ?? '', description: e.description ?? '', pictureId: e.pictureId ?? '', city: e.city ?? '', rating: e.rating ?? 0.0);
      }).toList() ?? [],
    );
  }
}