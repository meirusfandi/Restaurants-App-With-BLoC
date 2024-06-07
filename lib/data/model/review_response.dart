import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app_bloc/data/model/detail_recipe_response.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    bool? error,
    String? message,
    List<CustReviewResponse>? customerReviews,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => _$ReviewResponseFromJson(json);
}