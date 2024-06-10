import 'package:recipe_app_bloc/domain/entity/detail_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/usecase/get_detail_recipe.dart';
import 'package:recipe_app_bloc/presentation/bloc/home_bloc.dart';
export 'dart:async';
export 'package:dio/dio.dart';
export 'package:equatable/equatable.dart';
export 'package:auto_route/auto_route.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter/services.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailRecipe getDetailRecipe;

  DetailBloc({required this.getDetailRecipe}): super (const DetailState()) {
    on<GetDetailRecipeEvent>(getDetailRestaurants);
  }

  Future<void> getDetailRestaurants(GetDetailRecipeEvent event, Emitter<DetailState> emit) async {
    try {
      emit(const DetailState.noValue());
      final data = getDetailRecipe(DetailParams(id: event.restaurantsId));
      await data.then((value) {
        if (value.error) {
          emit(state.copyWith(isloading: false, errorMessage: value.message));
        } else {
          emit(state.copyWith(
            isloading: false,
            errorMessage: value.message,
            detailRecipeEntity: value
          ));
        }
      });
    } on DioException catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(isloading: false, errorMessage: e.toString()));
    }
  }
}