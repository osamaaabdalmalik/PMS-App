import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pms_app/core/constants/app_colors.dart';

class PrimaryOTPTextField extends StatefulWidget {
  final void Function(String)? onCompleted;

  const PrimaryOTPTextField({this.onCompleted, super.key});

  @override
  State<PrimaryOTPTextField> createState() => _PrimaryOTPTextFieldState();
}

class _PrimaryOTPTextFieldState extends State<PrimaryOTPTextField> {
  final FocusNode focusNode = FocusNode();
  final OtpFieldController otpFieldController = OtpFieldController();
  String otp = '';
  bool otpHasError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: OTPTextField(
          controller: otpFieldController,
          hasError: otpHasError,
          length: 6,
          textFieldAlignment: MainAxisAlignment.spaceBetween,
          outlineBorderRadius: 8.r,
          fieldWidth: 35.w,
          style: TextStyle(fontSize: 17.sp),
          fieldStyle: FieldStyle.box,
          otpFieldStyle: OtpFieldStyle(
            borderColor: AppColors.gray,
            disabledBorderColor: AppColors.gray,
            enabledBorderColor: AppColors.gray,
            errorBorderColor: AppColors.danger,
            focusBorderColor: AppColors.primary,
          ),
          width: 300.w,
          onChanged: (pin) {
            setState(() {
              otpHasError = false;
              otp = pin;
            });
          },
          onCompleted: widget.onCompleted,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
