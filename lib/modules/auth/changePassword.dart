import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/CustomTextFormField.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/constant/otpButton.dart';
import 'package:moneycollection/constant/validation.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(builder: (context, authController, child) {
      return Consumer<ThemeModel>(builder: (context, theme, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90.0, bottom: 20),
                    child: Container(
                      height: 120.h,
                      width: 120.w,
                    
                      decoration: const BoxDecoration(
                        
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppImages.logo),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 250.0, left: 11, right: 11),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // color of shadow
        spreadRadius: 5, // spread radius
        blurRadius: 7, // blur radius
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                            borderRadius: BorderRadius.circular(16.0),
                            color: theme.currentTheme == lightTheme
                                ? AppColors.logoblueColor
                                : AppColors.primaryBlack),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildText(),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                labeltext: "Enter OTP",
                                hinttext: "Enter Otp ",
                                // height: 50,
                                controller: authController.newPasswordOtp,
                                validator: CustomValidator.validaterequired,
                              ),
                              const SizedBox(height: 2),
                              CustomTextFormField(
                                labeltext: "New Password",
                                hinttext: "Enter new password ",
                                // height: 50,
                                controller: authController.newPassword,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      authController.showPassword();
                                    },
                                    icon: authController.hidePassword
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                obstruct: authController.hidePassword,
                              ),
                              const SizedBox(height: 2),
                              CustomTextFormField(
                                labeltext: "Confirm Password",
                                hinttext: "Confirm new password ",
                                // height: 50,
                                controller: authController.newPasswordConfirm,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      authController.showPassword();
                                    },
                                    icon: authController.hidePassword
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                obstruct: authController.hidePassword,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: CustomButton(
                                  height: 45,
                                  title: "Create Password",
                                  textColor: AppColors.logoblueColor,
                                  onPressed: () {
                                    // authController.resetPassword(context);

                                    // Navigator.pushAndRemoveUntil(
                                    //   context,
                                    //   AnimatedNavigation(
                                    //       page: const MainPage()),(route) => false
                                    //
                                    // );
                                  },
                                  backgroundColor: AppColors.buttonGrey,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
    });
  }

  Widget _buildText() {
    return const Text(
      "Change Password",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
