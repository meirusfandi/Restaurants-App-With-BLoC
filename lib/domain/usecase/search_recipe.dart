import 'package:equatable/equatable.dart';
import 'package:recipe_app_bloc/core/utils/usecase.dart';
import 'package:recipe_app_bloc/domain/entity/list_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/entity/search_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';

class SearchRecipe extends  UseCase<SearchRecipeEntity, SearchParams> {
  final RecipeRepository _repository;
  SearchRecipe(this._repository);

  @override
  Future<SearchRecipeEntity> call(SearchParams params) async {
    final result = await _repository.searchRecipeData(params.query);
    return SearchRecipeEntity(
      error: result.error ?? false, 
      founded: result.founded ?? 0, 
      restaurants: result.restaurants?.map((e) {
        return RecipeDataEntity(id: e.id ?? '', name: e.name ?? '', description: e.description ?? '', pictureId: e.pictureId ?? '', city: e.city ?? '', rating: e.rating ?? 0.0);
      }).toList() ?? []
    );
  }
}

class SearchParams extends Equatable {
  final String query;

  const SearchParams({required this.query});

  @override
  List<Object?> get props => [query];

}