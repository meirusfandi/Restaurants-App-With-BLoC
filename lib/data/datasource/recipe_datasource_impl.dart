import 'dart:convert';
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
      final _response = await restClient.getDetailRestaurants(id);
      final result = DetailRecipeResponse.fromJson(_response.toJson());
      return Future.value(result);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  @override
  Future<ListRecipeResponse> getListRecipe() async {
    try {
      final _response = await restClient.getRestaurants();
      final result = ListRecipeResponse.fromJson(_response.toJson());
      return Future.value(result);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  @override
  Future<ReviewResponse> createReview(ReviewRequest request) async {
    try {
      final _response = await restClient.submitReview(request);
      final result = ReviewResponse.fromJson(_response.toJson());
      return Future.value(result);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  @override
  Future<SearchRecipeResponse> searchRecipe(String query) async {
    try {
      final _response = await restClient.searchRestaurants(query);
      final result = SearchRecipeResponse.fromJson(_response.toJson());
      return Future.value(result);
    } on DioException catch (e) {
      log('error: $e');
      rethrow;
    }
  }
}