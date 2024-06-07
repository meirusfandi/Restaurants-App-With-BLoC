import 'package:recipe_app_bloc/core/resources/rest_client.dart';
import 'package:recipe_app_bloc/data/datasource/recipe_datasource.dart';

class RecipeDatasourceImpl implements RecipeDatasource {
  final RestClient restClient;

  RecipeDatasourceImpl({required this.restClient});
}