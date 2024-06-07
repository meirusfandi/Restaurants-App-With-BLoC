import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_bloc/domain/entity/list_recipe_entity.dart';

part 'search_recipe_entity.freezed.dart';
part 'search_recipe_entity.g.dart';

@freezed
class SearchRecipeEntity with _$SearchRecipeEntity {
  const factory SearchRecipeEntity({
    required bool error,
    required int founded,
    required List<RecipeDataEntity> restaurants,
  }) = _SearchRecipeEntity;

  factory SearchRecipeEntity.fromJson(Map<String, dynamic> json) => _$SearchRecipeEntityFromJson(json);
}