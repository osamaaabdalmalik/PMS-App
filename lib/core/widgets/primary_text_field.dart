import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final bool isObscureText;
  final bool isTextArea;
  final bool isEnabled;
  final bool autofocus;
  final Widget? suffixIcon;
  final TextInputType inputType;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const PrimaryTextField({
    super.key,
    required this.labelText,
    this.isObscureText = false,
    this.isTextArea = false,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.controller,
    this.onTap,
    this.validator,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.hintText,
    this.padding,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool isVisibleText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus,
            onChanged: (value) {
              setState(() {});
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: AppColors.gray.withOpacity(0.5),
              ),
              errorMaxLines: 3,
              suffixIcon: widget.suffixIcon ??
                  (widget.isObscureText
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisibleText = !isVisibleText;
                            });
                          },
                          icon: isVisibleText
                              ? const Icon(
                                  CupertinoIcons.lock_slash,
                                  color: AppColors.gray,
                                )
                              : const Icon(
                                  CupertinoIcons.lock,
                                  color: AppColors.gray,
                                ),
                        )
                      : null),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  width: 0.6,
                  color: AppColors.gray,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.danger,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.danger,
                ),
              ),
              contentPadding: EdgeInsets.all(8.w),
            ),
            keyboardType: widget.inputType,
            obscureText: widget.isObscureText && !isVisibleText,
            maxLines: widget.isTextArea ? 4 : 1,
            minLines: widget.isTextArea ? 3 : 1,
            readOnly: widget.onTap != null,
            enabled: widget.isEnabled,
          ),
        ],
      ),
    );
  }
}
