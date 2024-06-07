import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_bloc/domain/entity/detail_recipe_entity.dart';

part 'review_entity.freezed.dart';
part 'review_entity.g.dart';

@freezed
class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required bool error,
    required String message,
    required List<CustReviewEntity> customerReviews,
  }) = _ReviewEntity;

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => _$ReviewEntityFromJson(json);
}