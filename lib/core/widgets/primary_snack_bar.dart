import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:pms_app/core/constants/app_colors.dart';

class PrimarySnackBar {
  final BuildContext context;
  final String title;
  final String message;
  final ContentType? contentType;
  final Color color;

  const PrimarySnackBar({
    required this.context,
    required this.title,
    required this.message,
    this.contentType,
    this.color = AppColors.primary,
  });

  SnackBar build() {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType ?? ContentType.help,
        color: color,
      ),
    );
  }
}
