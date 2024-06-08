import 'package:flutter/material.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';
import 'package:shimmer/shimmer.dart';

extension ShimmerUtils on Widget {
  Widget loadShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? Colors.grey,
      highlightColor: Colors.grey[100] ?? ContentColor.greyColor,
      child: this,
    );
  }
}
