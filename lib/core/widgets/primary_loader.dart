import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pms_app/core/constants/app_colors.dart';

class PrimaryLoader extends StatelessWidget {
  final double size;
  final Color color;
  final EdgeInsetsGeometry padding;

  const PrimaryLoader({
    super.key,
    this.size = 50,
    this.color = AppColors.primary,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LoadingAnimationWidget.threeArchedCircle(
        size: size,
        color: color,
      ),
    );
  }
}
