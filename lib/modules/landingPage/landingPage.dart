import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/auth/login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
          
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                
                   Padding(
                     padding:  EdgeInsets.only(left: 130.w, right: 120.w,top: 120.h),
             
                     child: SizedBox(
                      
                      
                      height: 150.h,
                      child: Image.asset(
                                      AppImages.logo,
                                    ),
                                     
                           
                                     ),
                   ),
              
              ],
            ),
           SizedBox(
            height: 100.h,
           ),
          //  Center(child: Text("Money Collection", style: TextStyle(
          //   fontSize: 25,
          //   fontWeight: FontWeight.w500
          //  ),)),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Company Code", style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
                       ),),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                
                 borderRadius: BorderRadius.circular(5),
                 border: Border.all(
                  color: Colors.black26,
                  width: 1.w
                 )
              ),
              child:
            TextField(
          decoration: InputDecoration(
            hintText: 'Company Code', // Placeholder text
            border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Colors.black26,
          width: 1,
        ),
            ),
          ),
        ),
            ),
          ),
          SizedBox(
            height: 20.h,
           ),
           
             
             Padding(
               padding:  EdgeInsets.only(left: 80.w, right:80.w),
               child: GestureDetector(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
                 child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                      color: Colors.blue,
                 
                  ),
                  height: 50.h,
                  
                             
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp
                      ),
                    ),
                  ),
                 ),
               ),
             )
          ],
        ),
      ),
    );
  }
}