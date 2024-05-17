import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AccountTexfield.dart';
import 'package:moneycollection/constant/CustomAppbar.dart';
import 'package:moneycollection/constant/FormField.dart';
import 'package:moneycollection/constant/colors.dart';

class DepositForm extends StatelessWidget {
  final Map<String, String> datas;

  const DepositForm({Key? key, required this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              
               Container(
                    
                    height: 120.h,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(5.r), bottomRight: Radius.circular(5.r)),
                      color: AppColors.primaryBlue,
                    ),
                    
        
                  ),
                   const CustomAppBar(
                    label: "Deposit Form",
                  ),
                  Padding(
                  padding:  EdgeInsets.only(top: 70.h, right: 10, left: 10),
                  child: Container(
                        height: 800.h,
                       
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                           color:Colors.white,
                            boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
                           
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                                    
                                    const FormCustomTextField("2022-10-22", label: "Tran Date(AD)"),
                                    const SizedBox(height: 10,),
                                    
                                    const FormCustomTextField("2072-1-2", label: "Tran Date(BS)"),
                                    const SizedBox(height: 10,),
                                    Text(
                          "Account Number",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                          height:10
                                      ),
                                    AccountTextField(),
                                    const SizedBox(
                          height:10
                                      ),
                                      const FormCustomTextField("2022-10-22", label: "Tran Date(AD)"),
                                    const SizedBox(height: 10,),
                                    
                                    const FormCustomTextField("0.00", label: " Deposit Amount"),
                                    const SizedBox(height: 10,),
                                    const FormCustomTextField( "",label: "Deposite By"),
                                    const SizedBox(height: 10,),
                                     const FormCustomTextField("", label: "Source of Income"),
                                    const SizedBox(height: 10,),
                                    const SizedBox(
                          height:20
                                      ),
                                      
                                      Padding(
                           padding:  EdgeInsets.only(left: 100.w, right:100.w),
                           child: GestureDetector(
                            onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const MainPage()),
                            // );
                          },
                          
                             child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.primaryBlue,
                             
                              ),
                              height: 40.h,
                              
                                         
                              child: Center(
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
                      ),
                )
            ],
          ),
        )
      ),
    );
    // Use the data passed from the previous page
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Deposit Form'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('Account Number: ${datas['Account no.']}'),
    //         Text('Account Type: ${datas['Account Type']}'),
    //         // Add more fields as needed
    //       ],
    //     ),
    //   ),
    // );
  }
}
