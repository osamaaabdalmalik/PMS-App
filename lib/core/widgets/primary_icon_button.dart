import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryIconButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

  const PrimaryIconButton({
    required this.icon,
    this.color = AppColors.primary20,
    this.onPressed,
    super.key,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(5.r),
        color: color,
      ),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius ?? BorderRadius.circular(5.r),
          child: Container(
            padding: padding ?? EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(5.r),
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}
