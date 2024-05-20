import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/colors.dart';

class MyInformation extends StatefulWidget {
  const MyInformation({super.key});

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        body: Stack(children: [
         
           Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r)),
                    color: AppColors.primaryBlue,
                  ),
                ),
Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
           
            Text(
              "My Information", // Correcting string interpolation
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
                //  const CustomAppBar(label: "My Information"),
                
                Padding(
                  padding: const EdgeInsets.only(top:70.0,left: 10, right: 10),
                  child: Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                       boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InformationContent(
                          name: "Name",
                          label: "Pragyan Maharjan",
                        ),
        
                         InformationContent(
                          name: "Address",
                          label: "Bhaktapur",
                        ),
                         InformationContent(
                          name: "Gender",
                          label: "Male",
                        ),
                         InformationContent(
                          name: "Branch",
                          label: "Head Office",
                        )
                      ],
                    ),
                  ),
                
                ),
        ],
          
        ),
      ),
    );
  }
}

class InformationContent extends StatelessWidget {
  final String name;
   final String label;

  const InformationContent({
    required this.label,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20,),
            child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400),
                          ),
          ),
        ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 20),
                          child: Text(
                            label,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
    
      ],
    );
  }
}