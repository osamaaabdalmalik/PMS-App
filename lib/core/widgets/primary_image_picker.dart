import 'dart:io';

import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/helpers/pickers.dart';
import 'package:consultations_app/core/widgets/primary_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PrimaryImagePicker extends StatefulWidget {
  final String labelText;
  final void Function(File? file)? onImagePick;

  const PrimaryImagePicker({
    super.key,
    required this.labelText,
    this.onImagePick,
  });

  @override
  State<PrimaryImagePicker> createState() => _PrimaryImagePickerState();
}

class _PrimaryImagePickerState extends State<PrimaryImagePicker> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
          if (file == null)
            Center(
              child: PrimaryIconButton(
                color: AppColors.transparent,
                onPressed: () async {
                  File? file = await Pickers.pickImage(ImageSource.gallery);
                  if (file != null) {
                    setState(() => this.file = file);
                    if (widget.onImagePick != null) {
                      widget.onImagePick!.call(file);
                    }
                  }
                },
                icon: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primary20,
                      ),
                      child: const Icon(Icons.cloud_upload_sharp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppStrings.uploadProfileImage,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.gray,
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          if (file != null)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(
                          File(file!.path),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      PrimaryIconButton(
                        onPressed: () async {
                          setState(() => file = null);
                        },
                        padding: EdgeInsets.all(5.w),
                        borderRadius: BorderRadius.circular(50.sp),
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.danger,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      PrimaryIconButton(
                        onPressed: () async {
                          File? file = await Pickers.pickImage(ImageSource.gallery);
                          if (file != null) {
                            setState(() => this.file = file);
                            if (widget.onImagePick != null) {
                              widget.onImagePick!.call(file);
                            }
                          }
                        },
                        padding: EdgeInsets.all(5.w),
                        borderRadius: BorderRadius.circular(50.sp),
                        icon: const Icon(Icons.image_search),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
