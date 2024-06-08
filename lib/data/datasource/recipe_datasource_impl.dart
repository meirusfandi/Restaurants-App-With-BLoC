import 'package:dio/dio.dart';
import 'package:recipe_app_bloc/core/resources/rest_client.dart';
import 'package:recipe_app_bloc/data/datasource/recipe_datasource.dart';
import 'package:recipe_app_bloc/data/model/detail_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/list_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/review_request.dart';
import 'package:recipe_app_bloc/data/model/review_response.dart';
import 'package:recipe_app_bloc/data/model/search_recipe_response.dart';

class RecipeDatasourceImpl implements RecipeDatasource {
  final RestClient restClient;

  RecipeDatasourceImpl({required this.restClient});

  @override
  Future<DetailRecipeResponse> getDetailRecipe(String id) async {
    try {
      final response = await restClient.getDetailRestaurants(id);
      final result = DetailRecipeResponse.fromJson(response.toJson());
      return Future.value(result);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<ListRecipeResponse> getListRecipe() async {
    try {
      final response = await restClient.getRestaurants();
      final result = ListRecipeResponse.fromJson(response.toJson());
      return Future.value(result);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<ReviewResponse> createReview(ReviewRequest request) async {
    try {
      final response = await restClient.submitReview(request);
      final result = ReviewResponse.fromJson(response.toJson());
      return Future.value(result);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<SearchRecipeResponse> searchRecipe(String query) async {
    try {
      final response = await restClient.searchRestaurants(query);
      final result = SearchRecipeResponse.fromJson(response.toJson());
      return Future.value(result);
    } on DioException catch (_) {
      rethrow;
    }
  }
}