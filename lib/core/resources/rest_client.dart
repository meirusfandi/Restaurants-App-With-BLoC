import 'package:dio/dio.dart';
import 'package:recipe_app_bloc/data/model/detail_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/list_recipe_response.dart';
import 'package:recipe_app_bloc/data/model/review_request.dart';
import 'package:recipe_app_bloc/data/model/review_response.dart';
import 'package:recipe_app_bloc/data/model/search_recipe_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('list')
  Future<ListRecipeResponse> getRestaurants();

  @GET('search')
  Future<SearchRecipeResponse> searchRestaurants(@Query("q") String query);

  @GET('detail/{id}')
  Future<DetailRecipeResponse> getDetailRestaurants(@Path('id') String idResto);

  @POST('review')
  Future<ReviewResponse> submitReview(@Body() ReviewRequest request);
}