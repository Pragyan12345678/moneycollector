import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/Button.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/constant/textfield.dart';
import 'package:moneycollection/constant/utils.dart';
import 'package:moneycollection/constant/validation.dart';
import 'package:moneycollection/modules/auth/forgetPassword.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMeValue = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authController, child) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 150.h,
                      child: Image.asset(
                        AppImages.logo,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Welcome to Tech Finance',
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Please enter the credentials below to start using the app.',
                      style: subtitleStyle.copyWith(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyInputField(
                    labelText: 'Email',
                    controller: authController.loginEmail,
                    textInputAction: TextInputAction.next,
                    validator: CustomValidator.validateEmail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyInputField(
                    labelText: 'Password',
                    textInputAction: TextInputAction.done,
                    controller: authController.loginPassword,
                    validator: CustomValidator.validatePassword,
                    suffix: IconButton(
                        onPressed: () {
                          authController.showPassword();
                        },
                        icon: authController.hidePassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(
                          'Forgot password?',
                          style: subtitleStyle.copyWith(
                              color: AppColors.logoblueColor, fontSize: 12.sp),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordView()),
                          );
                        },
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          activeColor: AppColors.textColorBlack,
                          value: rememberMeValue,
                          onChanged: (value) {
                            setState(() {
                              rememberMeValue = value!;
                              // AppStorage.saveRememberme(value);
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Remember Me',
                            style: subtitleStyle.copyWith(fontSize: 12.sp),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomButtons(
                      label: 'Sign In',
                      txtClr: Colors.white,
                      btnClr: AppColors.logoblueColor,
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          authController.Login(context);
                          print('Emailsss: ${authController.loginEmail.text}');
                          print(
                              'Passwordssss: ${authController.loginPassword.text}');
                        } else {
                          Utilities.showCustomSnackBar(
                              "Invalid Email and Password.");
                        }
                      },
                    ),
                  ),
                  // SizedBox(
                  //     height: 50,
                  //     width: double.infinity,
                  //     child: controller.loginLoading.isTrue
                  //         ? CustomButtons(
                  //             label: '. . . ',
                  //             txtClr: Colors.white,
                  //             btnClr: AppColor.kalaAppMainColor,
                  //             ontap: () {},
                  //           )
                  //         : CustomButtons(
                  //             label: 'Sign In',
                  //             txtClr: Colors.white,
                  //             btnClr: AppColor.kalaAppMainColor,
                  //             ontap: () {
                  //               if (_formKey.currentState!.validate()) {
                  //                 controller.loginLoading.value
                  //                     ? null
                  //                     : controller.login();
                  //                 // then(
                  //                 //         () {
                  //                 //           landingcontroller.onInit();
                  //                 //           landingcontroller.fetchJustForYou(
                  //                 //             landingcontroller
                  //                 //                 .selectedSlug.value,
                  //                 //           );
                  //                 //         },
                  //                 //       );
                  //                 controller.rememberMeData();
                  //               }
                  //             },
                  //           ),
                  //   ),
                ],
              )),
        )),
      );
    });
  }
}
