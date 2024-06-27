import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pms_app/core/constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final double size;
  final double? iconSize;
  final double radius;
  final void Function()? onPressed;

  const CustomIconButton({
    required this.icon,
    this.iconColor = AppColors.primary,
    this.backgroundColor,
    this.size = 40,
    this.radius = 10,
    this.iconSize = 25,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: BorderRadius.circular(radius.r),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: size.h,
          height: size.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? iconColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(radius.r),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize?.h,
          ),
        ),
      ),
    );
  }
}
