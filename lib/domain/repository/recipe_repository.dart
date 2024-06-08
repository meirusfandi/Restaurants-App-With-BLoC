import 'package:recipe_app_bloc/data/model/detail_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/list_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/review_response.dart';
import 'package:recipe_app_bloc/data/model/search_recipe_response.dart';
import 'package:recipe_app_bloc/domain/usecase/do_add_review.dart';

abstract class RecipeRepository {
  Future<ListRecipeResponse> getListData();
  Future<SearchRecipeResponse> searchRecipeData(String query);
  Future<DetailRecipeResponse> detailRecipe(String id);
  Future<ReviewResponse> createReview(AddReviewParams params);
}