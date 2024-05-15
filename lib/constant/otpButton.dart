import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/Circularprogressindicatior.dart';


class CustomButton extends StatelessWidget {
  final String? title;
  final String? datelabel;
  final String? label;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onPressed;
  final double? height;
  final Color? backgroundColor;
  final IconData? icon;
  final IconData? timeicon;
  final Color? textColor;
  final double? width;
  final double? radius;
  final bool isLoading;

  const CustomButton({
    Key? key,
    this.title,
    this.datelabel,
    this.timeicon,
    this.label,
    this.height,
    this.radius,
    this.borderRadius,
    this.textColor,
    this.width,
    this.icon,
    this.backgroundColor,
    this.isLoading = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 4),
          ),
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? const CustomCircularProgressIndicator()
            : Text(
                title ?? "N/A",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
