import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_bloc/data/model/list_recipe_response.dart';

part 'search_recipe_response.freezed.dart';
part 'search_recipe_response.g.dart';

@freezed
class SearchRecipeResponse with _$SearchRecipeResponse {
  const factory SearchRecipeResponse({
    bool? error,
    int? founded,
    List<RecipeDataResponse>? restaurants,
  }) = _SearchRecipeResponse;

  factory SearchRecipeResponse.fromJson(Map<String, dynamic> json) => _$SearchRecipeResponseFromJson(json);
}