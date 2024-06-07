import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request.freezed.dart';
part 'review_request.g.dart';

@freezed
class ReviewRequest with _$ReviewRequest {
  const factory ReviewRequest({
    String? id,
    String? review,
    String? name,
  }) = _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, Object?> json) => _$ReviewRequestFromJson(json);
}