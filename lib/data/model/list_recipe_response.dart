import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_recipe_response.freezed.dart';
part 'list_recipe_response.g.dart';

@freezed
class ListRecipeResponse with _$ListRecipeResponse {
  const factory ListRecipeResponse({
    bool? error,
    String? message,
    int? count,
    List<RecipeDataResponse>? restaurants,
  }) = _ListRecipeResponse;

  factory ListRecipeResponse.fromJson(Map<String, dynamic> json) => _$ListRecipeResponseFromJson(json);
}

@freezed
class RecipeDataResponse with _$RecipeDataResponse {
  const factory RecipeDataResponse({
    String? id,
    String? name,
    String? description,
    String? pictureId,
    String? city,
    num? rating,
  }) = _RecipeDataResponse;

  factory RecipeDataResponse.fromJson(Map<String, dynamic> json) => _$RecipeDataResponseFromJson(json);
}
