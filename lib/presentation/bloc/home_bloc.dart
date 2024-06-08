import 'package:recipe_app_bloc/domain/entity/list_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/usecase/get_list_recipe.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';
export 'dart:async';
export 'package:dio/dio.dart';
export 'package:equatable/equatable.dart';
export 'package:auto_route/auto_route.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter/services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetListRecipe getListRecipe;

  HomeBloc({required this.getListRecipe}): super (const HomeState()) {
    on<GetRecipeEvent>(_getListRecipe);
  }

  Future<void> _getListRecipe(GetRecipeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.noValue());
      final data = getListRecipe();
      data.then((value) {
        if (value.error) {
          emit(state.copyWith(isloading: false, errorMessage: value.message));
        } else {
          emit(state.copyWith(
            isloading: false,
            errorMessage: value.message,
            listRecipeEntity: value
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }
}