import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_recipe_entity.freezed.dart';
part 'detail_recipe_entity.g.dart';

@freezed
class DetailRecipeEntity with _$DetailRecipeEntity {
  const factory DetailRecipeEntity({
    required bool error,
    required String message,
    required DetailRecipeDataEntity restaurant,
  }) = _DetailRecipeEntity;

  factory DetailRecipeEntity.fromJson(Map<String, dynamic> json) => _$DetailRecipeEntityFromJson(json);
}

@freezed
class DetailRecipeDataEntity with _$DetailRecipeDataEntity {
  const factory DetailRecipeDataEntity({
    required String id,
    required String name,
    required String description,
    required String city,
    required String address,
    required String pictureId,
    required num rating,
    required List<NameEntity> categories,
    required MenuEntity menus,
    required List<CustReviewEntity> customerReviews,
  }) = _DetailRecipeDataEntity;

  factory DetailRecipeDataEntity.fromJson(Map<String, dynamic> json) => _$DetailRecipeDataEntityFromJson(json);
}

@freezed
class NameEntity with _$NameEntity {
  const factory NameEntity({
    required String name,
  }) = _NameEntity;

  factory NameEntity.fromJson(Map<String, dynamic> json) => _$NameEntityFromJson(json);
}

@freezed
class MenuEntity with _$MenuEntity {
  const factory MenuEntity({
    required List<NameEntity> foods,
    required List<NameEntity> drinks,
  }) = _MenuEntity;

  factory MenuEntity.fromJson(Map<String, dynamic> json) => _$MenuEntityFromJson(json);
}

@freezed
class CustReviewEntity with _$CustReviewEntity {
  const factory CustReviewEntity({
    required String name,
    required String review,
    required String date,
  }) = _CustReviewEntity;

  factory CustReviewEntity.fromJson(Map<String, dynamic> json) => _$CustReviewEntityFromJson(json);
}