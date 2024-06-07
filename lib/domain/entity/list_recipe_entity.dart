import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_recipe_entity.freezed.dart';
part 'list_recipe_entity.g.dart';

@freezed
class ListRecipeEntity with _$ListRecipeEntity {
  const factory ListRecipeEntity({
    required bool error,
    required String message,
    required int count,
    required List<RecipeDataEntity> restaurants,
  }) = _ListRecipeEntity;

  factory ListRecipeEntity.fromJson(Map<String, dynamic> json) => _$ListRecipeEntityFromJson(json);
}

@freezed
class RecipeDataEntity with _$RecipeDataEntity {
  const factory RecipeDataEntity({
    required String id,
    required String name,
    required String description,
    required String pictureId,
    required String city,
    required num rating,
  }) = _RecipeDataEntity;

  factory RecipeDataEntity.fromJson(Map<String, dynamic> json) => _$RecipeDataEntityFromJson(json);
}
