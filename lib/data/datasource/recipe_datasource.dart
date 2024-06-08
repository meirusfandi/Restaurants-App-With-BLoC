import 'package:recipe_app_bloc/data/model/detail_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/list_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/review_request.dart';
import 'package:recipe_app_bloc/data/model/review_response.dart';
import 'package:recipe_app_bloc/data/model/search_recipe_response.dart';

abstract class RecipeDatasource {
  Future<ListRecipeResponse> getListRecipe();
  Future<DetailRecipeResponse> getDetailRecipe(String id);
  Future<ReviewResponse> createReview(ReviewRequest request);
  Future<SearchRecipeResponse> searchRecipe(String query);
}