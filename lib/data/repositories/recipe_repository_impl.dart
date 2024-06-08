import 'package:recipe_app_bloc/data/datasource/recipe_datasource.dart';
import 'package:recipe_app_bloc/data/model/detail_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/list_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/review_request.dart';
import 'package:recipe_app_bloc/data/model/review_response.dart';
import 'package:recipe_app_bloc/data/model/search_recipe_response.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';
import 'package:recipe_app_bloc/domain/usecase/do_add_review.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDatasource _datasource;

  RecipeRepositoryImpl(this._datasource);

  @override
  Future<ReviewResponse> createReview(AddReviewParams params) async {
    final result = await _datasource.createReview(ReviewRequest(id: params.id, name: params.name, review: params.review));
    return result;
  }

  @override
  Future<DetailRecipeResponse> detailRecipe(String id) async {
    final result = await _datasource.getDetailRecipe(id);
    return result;
  }

  @override
  Future<ListRecipeResponse> getListData() async {
    final result = await _datasource.getListRecipe();
    return result;
  }

  @override
  Future<SearchRecipeResponse> searchRecipeData(String query) async {
    final result = await _datasource.searchRecipe(query);
    return result;
  }
  
} 