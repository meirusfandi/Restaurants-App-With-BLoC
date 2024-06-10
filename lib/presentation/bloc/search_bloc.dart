import 'package:recipe_app_bloc/domain/entity/search_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/usecase/search_recipe.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';
export 'dart:async';
export 'package:dio/dio.dart';
export 'package:equatable/equatable.dart';
export 'package:auto_route/auto_route.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRecipe searchRecipe;

  SearchBloc({required this.searchRecipe}): super (const SearchState()) {
    on<SearchRecipeEvent>(searchRestaurants);
  }

  Future<void> searchRestaurants(SearchRecipeEvent event, Emitter<SearchState> emit) async {
    try {
      emit(const SearchState.noValue());
      final data = searchRecipe(SearchParams(query: event.query));
      await data.then((value) {
        if (value.error) {
          emit(state.copyWith(isloading: false, errorMessage: 'Error get data!'));
        } else {
          emit(state.copyWith(
              isloading: false,
              errorMessage: "Data Found!",
              searchRecipeEntity: value
          ));
        }
      });
    } on DioException catch (e){
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }
}