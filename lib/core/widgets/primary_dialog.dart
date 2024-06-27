import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pms_app/core/constants/app_colors.dart';
import 'package:pms_app/core/widgets/primary_button.dart';

class PrimaryDialog extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final Color color;
  final List<Widget> children;
  final void Function()? onTap;

  const PrimaryDialog({
    required this.title,
    required this.buttonLabel,
    this.color = AppColors.primary,
    this.children = const [],
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    height: 1.32,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ...children,
                Padding(
                  padding: EdgeInsets.only(top: 40.h, bottom: 10.h, left: 20, right: 20),
                  child: PrimaryButton(
                    text: buttonLabel,
                    onPressed: () {
                      context.pop();
                      onTap?.call();
                    },
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
