// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:moneycollection/constant/Button.dart';
// import 'package:moneycollection/constant/colors.dart';
// import 'package:moneycollection/constant/image.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';


// class OtpAuthenticationView extends StatefulWidget {
//   final String? email;

//   const OtpAuthenticationView({
//     super.key,
//     this.email,
//   });

//   @override
//   State<OtpAuthenticationView> createState() => _OtpAuthenticationViewState();
// }

// class _OtpAuthenticationViewState extends State<OtpAuthenticationView> {

//   late Timer _timer;
//   int remainingTime = 120;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (remainingTime > 0) {
//           remainingTime--;
//         } else {
//           _timer.cancel();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void sendOtp() {
//     // Implement your logic to resend OTP here
//     // This method will be triggered when the "Resend" text is tapped
//   }

//   String formatTime(int seconds) {
//     int minutes = (seconds / 60).floor();
//     int remainingSeconds = seconds % 60;
//     String minutesStr = minutes.toString().padLeft(2, '0');
//     String secondsStr = remainingSeconds.toString().padLeft(2, '0');
//     return '$minutesStr:$secondsStr';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async {
//           return await showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: const Text('Exit'),
//               content: const Text('Do you want to exit?'),
//               actions: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         AppColors.logoblueColor, // Set the button's background color
//  // Set the button's background color
//                   ),
//                   onPressed: () {
//                     Navigator.of(context)
//                         .pop(false); // Return false to prevent exiting
//                   },
//                   child: const Text('No'),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors
//                         .logoblueColor, // Set the button's background color
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop(true); // Return true to exit
//                   },
//                   child: const Text('Yes'),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Center(
//                   child: Image.asset(
//                     AppImages.logo,
//                     height: 100,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   'OTP Authentication',
//                   style: headingStyle.copyWith(
//                     fontSize: 16.sp,
//                   )
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'An authentication code have been sent to  ${widget.email}',
//                   style: subtitleStyle.copyWith(color: Colors.grey, fontSize: 14.sp),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 OTPTextField(
//                   length: 5,
//                   width: MediaQuery.of(context).size.width,
//                   // controller: controller.otpController,
//                   fieldWidth: 40,
//                   style: const TextStyle(fontSize: 17),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.underline,
//                   onCompleted: (pin) {
//                     // ignore: avoid_print
//                     print("Completed: $pin");
//                     // controller.getOtp(pin);
//                   },
//                   onChanged: (v) {},
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     RichText(
//                       text: const TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'Did not receive the code? ',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                     remainingTime == 0
//                         ? GestureDetector(
//                             onTap: () {
//                               // controller.sendOtp();
//                             },
//                             child: const Text(
//                               'Resend',
//                               style: TextStyle(color: Colors.orange),
//                             ),
//                           )
//                         : Text(
//                             '$remainingTime seconds remaining',
//                             // Display the remaining time
//                             style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w300,
//                                 color: AppColors.logoblueColor,),
//                           ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: CustomButtons(
//                     label: 'Continue',
//                     btnClr: AppColors
//                         .logoblueColor,
//                     txtClr: Colors.white,
//                     ontap: () {
//                             Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => OtpAuthenticationView()),
//   );
//                       // controller.optloading.value
//                           // ? null
//                           // : controller
//                           //     .getOtp(controller.otpController.toString());
//                       // Get.to(() => const ResetPasswordView());
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
