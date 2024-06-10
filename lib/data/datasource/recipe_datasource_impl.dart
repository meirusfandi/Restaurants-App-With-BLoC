import 'dart:developer';

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
      return Future.value(response);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  @override
  Future<ListRecipeResponse> getListRecipe() async {
    try {
      final response = await restClient.getRestaurants();
      return Future.value(response);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  @override
  Future<ReviewResponse> createReview(ReviewRequest request) async {
    try {
      final response = await restClient.submitReview(request);
      return Future.value(response);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  @override
  Future<SearchRecipeResponse> searchRecipe(String query) async {
    try {
      final response = await restClient.searchRestaurants(query);
      return Future.value(response);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }
}