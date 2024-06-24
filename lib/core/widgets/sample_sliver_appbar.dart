import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:consultations_app/core/widgets/primary_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SampleSliverAppbar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;

  const SampleSliverAppbar({
    super.key,
    this.leading,
    required this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return PrimarySliverAppbar(
      leading: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 8.w),
            child: leading ??
                PrimaryIconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  color: AppColors.transparent,
                  padding: EdgeInsetsDirectional.all(10.h).copyWith(
                    start: 15.h,
                    end: 5.h,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      actions: actions,
      expandedHeight: 60.h,
    );
  }
}
