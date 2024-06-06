// ignore: file_names
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String label;
  final Color btnClr;
  final Color txtClr;
  final VoidCallback ontap;
  final EdgeInsets? margin;
  final double? width;

  const CustomButtons({
    Key? key,
    required this.label,
    required this.btnClr,
    required this.txtClr,
    required this.ontap,
    this.margin,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        decoration: const BoxDecoration(boxShadow: []),
        child: MaterialButton(
          onPressed: ontap,
          elevation: 5,
          color: btnClr,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            label,
            style: TextStyle(color: txtClr), // Assuming you have a TextStyle variable for titleStyle
          ),
        ),
      ),
    );
  }
}
