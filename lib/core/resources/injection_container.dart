import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app_bloc/core/resources/rest_client.dart';
import 'package:recipe_app_bloc/core/utils/constants.dart';
import 'package:recipe_app_bloc/data/datasource/recipe_datasource.dart';
import 'package:recipe_app_bloc/data/datasource/recipe_datasource_impl.dart';
import 'package:recipe_app_bloc/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';
import 'package:recipe_app_bloc/generated/l10n.dart';

final sl = GetIt.I;
const channel = MethodChannel('com.meirusfandi/methodchannel');

Future<void> init() async {
  final Dio _dio = Dio();
  
  sl.registerLazySingleton(() => S());
  sl.registerSingleton<RestClient>(RestClient(_dio, baseUrl: apiServer));
  sl.registerLazySingleton(() => const AppLocalizationDelegate());
  
  //Datasource
  sl.registerLazySingleton<RecipeDatasource>(() => RecipeDatasourceImpl(restClient: sl()));

  // Repository
  sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl());

  // Usecase
  // sl.registerLazySingleton(() => DoLogin(loginRepository: sl()));

  //bloc
  // sl.registerLazySingleton<LoginBloc>(() => LoginBloc(doLogin: sl(), doLoginV2: sl()));
  
}

