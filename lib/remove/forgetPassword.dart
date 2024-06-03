import 'package:flutter/material.dart';
import 'package:moneycollection/constant/Button.dart';
import 'package:moneycollection/constant/CustomCircularIcon.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/constant/textfield.dart';
import 'package:moneycollection/constant/validation.dart';
import 'package:moneycollection/remove/changePassword.dart';


class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomCircularIcon(),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    AppImages.logo,
                    height: 150,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Recovery Password',
                  style: headingStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please enter your email below to receive your password reset instruction',
                  style: subtitleStyle.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyInputField(
                  labelText: 'Example@gmail.com',
                  validator: CustomValidator.validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtons(
                    label: 'Send OTP',
                    btnClr: AppColors.logoblueColor,
                    txtClr: Colors.white,
                    ontap: () {
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ResetPassword()),
  );

                      // if (_formKey.currentState!.validate()) {
                      //   // Send OTP logic here
                      //   // If loading, show loading indicator, else navigate to ResetPasswordView
                      //   Get.to(ResetPasswordView());
                      // }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
