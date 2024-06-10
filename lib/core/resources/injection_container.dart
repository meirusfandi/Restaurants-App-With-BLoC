import 'package:get_it/get_it.dart';
import 'package:recipe_app_bloc/core/resources/rest_client.dart';
import 'package:recipe_app_bloc/core/utils/constants.dart';
import 'package:recipe_app_bloc/data/datasource/recipe_datasource.dart';
import 'package:recipe_app_bloc/data/datasource/recipe_datasource_impl.dart';
import 'package:recipe_app_bloc/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';
import 'package:recipe_app_bloc/domain/usecase/do_add_review.dart';
import 'package:recipe_app_bloc/domain/usecase/get_detail_recipe.dart';
import 'package:recipe_app_bloc/domain/usecase/get_list_recipe.dart';
import 'package:recipe_app_bloc/domain/usecase/search_recipe.dart';
import 'package:recipe_app_bloc/generated/l10n.dart';
import 'package:recipe_app_bloc/presentation/bloc/detail_bloc.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';
import 'package:recipe_app_bloc/presentation/bloc/search_bloc.dart';

final sl = GetIt.I;
const channel = MethodChannel('com.meirusfandi/methodchannel');

Future<void> init() async {
  final Dio dio = Dio();
  
  sl.registerLazySingleton(() => S());
  sl.registerSingleton<RestClient>(RestClient(dio, baseUrl: apiServer));
  sl.registerLazySingleton(() => const AppLocalizationDelegate());
  
  //Datasource
  sl.registerLazySingleton<RecipeDatasource>(() => RecipeDatasourceImpl(restClient: sl()));

  // Repository
  sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(sl()));

  // Usecase
  sl.registerLazySingleton(() => DoAddReview(sl()));
  sl.registerLazySingleton(() => SearchRecipe(sl()));
  sl.registerLazySingleton(() => GetListRecipe(sl()));
  sl.registerLazySingleton(() => GetDetailRecipe(sl()));

  //bloc
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(getListRecipe: sl()));
  sl.registerLazySingleton<DetailBloc>(() => DetailBloc(getDetailRecipe: sl()));
  sl.registerLazySingleton<SearchBloc>(() => SearchBloc(searchRecipe: sl()));
}

