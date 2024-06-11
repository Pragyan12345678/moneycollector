import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 120.h,
             
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.r), bottomRight: Radius.circular(5.r)),
                     color: AppColors.primaryBlue,
                ),
              ),
               const CustomAppBar(
                label: "Statement",
              ),






              const StatementCountview(),
             Padding(
               padding: const EdgeInsets.only(top: 200.0, right: 10, left: 10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Text("Tue,5 May ",style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),),
                      const SizedBox(height: 5,),
                   Container(
                      height: 60.h,
                   
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                           color: Colors.white,
                            boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("9860721670 ",style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400),),
                          
                                                Text("123456467 ",style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("NPR 3000 ",style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.red,
                                                    decoration: TextDecoration.none,
                                                    fontWeight: FontWeight.w400, ),),
                                                    SizedBox(width: 5.w,),

                                                  SizedBox(
                                                    height: 15.h,
                                                    width: 15.w,

                                                    child: Image.asset(AppImages.more,))
                                ],
                              ),
                          
                                                Text("NPR 3000 ",style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.primaryColor,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w400,),),
                            ],
                          ),
                        )
                      ],),
                      
                    ),
                 ],
               ),

             ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}

class StatementCountview extends StatelessWidget {
  const StatementCountview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 76.0,left: 10, right: 10),
      child: Container(
        height: 100.h,
                   
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
             color: Colors.white,
            boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Total Collection",style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),),
                  ),
                    Text("NPR 30000",style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),),],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text("Today Collection",style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400),),
                  ),
                    Text("NPR 30000",style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),),],
              ),
            ),
          ],
        ),
    
    
    
    
    
      ),
    );
  }
}

