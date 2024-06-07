import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_recipe_response.freezed.dart';
part 'detail_recipe_response.g.dart';

@freezed
class DetailRecipeResponse with _$DetailRecipeResponse {
  const factory DetailRecipeResponse({
    bool? error,
    String? message,
    DetailRecipeDataResponse? restaurant,
  }) = _DetailRecipeResponse;

  factory DetailRecipeResponse.fromJson(Map<String, dynamic> json) => _$DetailRecipeResponseFromJson(json);
}

@freezed
class DetailRecipeDataResponse with _$DetailRecipeDataResponse {
  const factory DetailRecipeDataResponse({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    num? rating,
    List<NameResponse>? categories,
    MenuResponse? menus,
    List<CustReviewResponse>? customerReviews,
  }) = _DetailRecipeDataResponse;

  factory DetailRecipeDataResponse.fromJson(Map<String, dynamic> json) => _$DetailRecipeDataResponseFromJson(json);
}

@freezed
class NameResponse with _$NameResponse {
  const factory NameResponse({
    String? name,
  }) = _NameResponse;

  factory NameResponse.fromJson(Map<String, dynamic> json) => _$NameResponseFromJson(json);
}

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    List<NameResponse>? foods,
    List<NameResponse>? drinks,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}

@freezed
class CustReviewResponse with _$CustReviewResponse {
  const factory CustReviewResponse({
    String? name,
    String? review,
    String? date,
  }) = _CustReviewResponse;

  factory CustReviewResponse.fromJson(Map<String, dynamic> json) => _$CustReviewResponseFromJson(json);
}