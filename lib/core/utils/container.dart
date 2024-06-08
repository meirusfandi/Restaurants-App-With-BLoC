import 'package:flutter/material.dart';
import 'package:recipe_app_bloc/core/utils/content_color.dart';

class ShadowedContainer extends StatelessWidget {
  final List<Widget> children;

  final Widget? hero;

  final bool noPadding;

  final double? width;

  final double? borderRadius;

  final bool useUpRadius;

  final double padding;
  final bool useOffset;

  final EdgeInsets? margin;

  const ShadowedContainer({
    super.key,
    required this.children,
    this.hero,
    this.borderRadius,
    this.noPadding = false,
    this.useUpRadius = false,
    this.useOffset = false,
    this.width,
    this.margin,
    this.padding = 16,
  });

  @override
  Widget build(context) {
    final content = Column(
      children: children,
    );
    final padded = Padding(
      padding: EdgeInsets.all(padding),
      child: content,
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: useUpRadius ? BorderRadius.only(topLeft: Radius.circular(borderRadius ?? 8), topRight: Radius.circular(borderRadius ?? 8)) : BorderRadius.circular(borderRadius ?? 8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.15),
            spreadRadius: -1,
            offset: useOffset ? const Offset(0, -5) : const Offset(-1, 1),
          ),
          useOffset ? const BoxShadow(blurRadius: 8, color: Colors.white, spreadRadius: 2, offset: Offset(3, 3)) : const BoxShadow(),
        ],
        color: Colors.white,
      ),
      width: width,
      child: hero == null
          ? (noPadding ? content : padded)
          : Column(
        children: [
          hero!,
          (noPadding ? content : padded),
        ],
      ),
    );
  }
}

class GenericCard extends StatelessWidget {
  const GenericCard({
    super.key,
    this.offset = const Offset(0, 8),
    this.blurRadius = 16,
    this.spreadRAdius = 0,
    this.shadowColor = const Color.fromRGBO(0, 0, 0, 0.08),
    this.borderRadius = 16,
    this.color = Colors.white,
    this.margin,
    required this.child,
  });
  final Color shadowColor;
  final Color color;
  final double blurRadius;
  final Offset offset;
  final double spreadRAdius;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            spreadRadius: spreadRAdius,
            color: shadowColor,
          ),
        ],
      ),
      child: child,
    );
  }
}

class ShimmerBox extends Container {
  ShimmerBox({
    super.key,
    super.height,
    super.width,
  }) : super(
    decoration: BoxDecoration(color: ContentColor.lightColor, borderRadius: BorderRadius.circular(6)),
    padding: const EdgeInsets.all(6),
  );
}

extension PaddedWidget on Widget {
  Widget rightPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(right: value.toDouble()),
    child: this,
  );
  Widget topPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(top: value.toDouble()),
    child: this,
  );
  Widget leftPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(left: value.toDouble()),
    child: this,
  );
  Widget bottomPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(bottom: value.toDouble()),
    child: this,
  );
  Widget verticalPadded([final value = 16]) => Padding(
    padding: EdgeInsets.symmetric(vertical: value.toDouble()),
    child: this,
  );
  Widget horizontalPadded([final value = 16]) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value.toDouble()),
    child: this,
  );
  Widget padded([final value = 16]) => Padding(
    padding: EdgeInsets.all(value.toDouble()),
    child: this,
  );
  Widget withoutTopPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(left: value.toDouble(), right: value.toDouble(), bottom: value.toDouble()),
    child: this,
  );
  Widget withoutBottomPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(left: value.toDouble(), top: value.toDouble(), right: value.toDouble()),
    child: this,
  );
  Widget withoutLeftPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(right: value.toDouble(), top: value.toDouble(), bottom: value.toDouble()),
    child: this,
  );
  Widget withoutRightPadded([final value = 16]) => Padding(
    padding: EdgeInsets.only(left: value.toDouble(), top: value.toDouble(), bottom: value.toDouble()),
    child: this,
  );
}

extension MarginWidget on Widget {
  Widget rightMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(right: value.toDouble()),
    child: this,
  );
  Widget topMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(top: value.toDouble()),
    child: this,
  );
  Widget leftMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(left: value.toDouble()),
    child: this,
  );
  Widget bottomMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(bottom: value.toDouble()),
    child: this,
  );
  Widget verticalMargin([final value = 16]) => Container(
    margin: EdgeInsets.symmetric(vertical: value.toDouble()),
    child: this,
  );
  Widget horizontalMargin([final value = 16]) => Container(
    margin: EdgeInsets.symmetric(horizontal: value.toDouble()),
    child: this,
  );
  Widget margin([final value = 16]) => Container(
    margin: EdgeInsets.all(value.toDouble()),
    child: this,
  );
  Widget withoutTopMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(left: value.toDouble(), right: value.toDouble(), bottom: value.toDouble()),
    child: this,
  );
  Widget withoutBottomMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(left: value.toDouble(), top: value.toDouble(), right: value.toDouble()),
    child: this,
  );
  Widget withoutLeftMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(right: value.toDouble(), top: value.toDouble(), bottom: value.toDouble()),
    child: this,
  );
  Widget withoutRightMargin([final value = 16]) => Container(
    margin: EdgeInsets.only(left: value.toDouble(), top: value.toDouble(), bottom: value.toDouble()),
    child: this,
  );
}
