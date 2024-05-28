import 'package:flutter/material.dart';
import 'package:moneycollection/constant/image.dart';

class Nodata extends StatelessWidget {
  const Nodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 180,
        width: 120,
         
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.nodata),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("No data", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
            ),
          ],
        ),
      
      ),
    );
  }
}