import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pms_app/core/constants/app_colors.dart';

class PrimarySelectItem<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final T? selectedItem;
  final void Function(T? value) onChanged;
  final Widget? suffixIcon;

  const PrimarySelectItem({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.items,
    required this.selectedItem,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              hint: Text(
                hintText,
                style: TextStyle(color: AppColors.gray.withOpacity(0.5)),
              ),
              items: items,
              value: selectedItem,
              onChanged: onChanged,
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: suffixIcon ??
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.gray,
                      ),
                ),
              ),
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1, color: AppColors.gray),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
