import 'package:equatable/equatable.dart';
import 'package:recipe_app_bloc/core/utils/usecase.dart';
import 'package:recipe_app_bloc/domain/entity/detail_recipe_entity.dart';
import 'package:recipe_app_bloc/domain/entity/review_entity.dart';
import 'package:recipe_app_bloc/domain/repository/recipe_repository.dart';

class DoAddReview implements UseCase<ReviewEntity, AddReviewParams> {
  final RecipeRepository _repository;
  DoAddReview(this._repository);
  
  @override
  Future<ReviewEntity> call(AddReviewParams params) async {
    final result = await _repository.createReview(params);
    return ReviewEntity(
      error: result.error ?? false, 
      message: result.message ?? '',
      customerReviews: result.customerReviews?.map((e) {
        return CustReviewEntity(
          name: e.name ?? '',
          review: e.review ?? '',
          date: e.date ?? ''
        );
      }).toList() ?? [],
    );
  }
}

class AddReviewParams extends Equatable {
  final String id;
  final String name;
  final String review;

  const AddReviewParams({required this.id, required this.name, required this.review});
  @override
  List<Object?> get props => [id, name, review];

}