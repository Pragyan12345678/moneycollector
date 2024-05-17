import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';


Future<dynamic> customShowDialog({
  required BuildContext context,
  required String title,
  required String content,
  required void Function()? onYesPressed,
  required void Function()? onNoPressed,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
            color: AppColors.primaryBrown,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: AppColors.primaryBrown,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onNoPressed,
            child: Text(
              "No",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.primaryBrown,
              ),
            ),
          ),
          TextButton(
            onPressed: onYesPressed,
            child: Text(
              "Yes",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.primaryBrown,
              ),
            ),
          ),
        ],
      );
    },
  );
}
