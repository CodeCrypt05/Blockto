import 'package:blockto_app/presentation/signup/signup_screen_controller.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/utils/components/loader.dart';
import 'package:blockto_app/utils/constants/colors.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:blockto_app/utils/validation/validation_mixin.dart';
import 'package:blockto_app/widget/auth_button/auth_buttons.dart';
import 'package:blockto_app/widget/common/custom_button.dart';
import 'package:blockto_app/widget/common/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ValidationsMixin {
  final signUpController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: const ClampingScrollPhysics(),
          child: Obx(
            () => Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 84.h),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffF5C249),
                    ),
                  ),
                  Text(
                    "Signup to get started",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffF5C249).withOpacity(0.6),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Form(
                      key: signUpController.signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //-- User name field

                          SizedBox(height: 36.h),
                          Text(
                            "Your name",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffF5C249).withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          CustomTextField(
                            maxLines: 1,
                            controller: signUpController.nameController,
                            textAlignVertical: TextAlignVertical.bottom,
                            hintText: "Enter your name",
                            suffixIcon: Container(
                              width: double.minPositive,
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.person_outline,
                                size: 20.h,
                                color: const Color(0xffF5C249).withOpacity(0.8),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF5C249).withOpacity(0.6),
                            ),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF5C249).withOpacity(0.8),
                            ),
                            validator: validatedName,
                          ),

                          //-- email  field

                          SizedBox(height: 16.h),
                          Text(
                            "E-mail address",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffF5C249).withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          CustomTextField(
                            maxLines: 1,
                            controller: signUpController.emailController,
                            textAlignVertical: TextAlignVertical.bottom,
                            hintText: "Enter your email",
                            suffixIcon: Container(
                              width: double.minPositive,
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.email_outlined,
                                size: 20.h,
                                color: const Color(0xffF5C249).withOpacity(0.8),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF5C249).withOpacity(0.6),
                            ),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF5C249).withOpacity(0.8),
                            ),
                            validator: validateEmail,
                          ),

                          //-- password  field

                          SizedBox(height: 16.h),
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffF5C249).withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          CustomTextField(
                            // isPassword: isPasswordVisible,
                            maxLines: 1,
                            controller: signUpController.passwordController,
                            textAlignVertical: TextAlignVertical.bottom,
                            hintText: "Enter your password",

                            suffixIcon: GestureDetector(
                              onTap: () => signUpController.hidePassword.value =
                                  !signUpController.hidePassword.value,
                              child: Container(
                                width: double.minPositive,
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  signUpController.hidePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 20.h,
                                  color:
                                      const Color(0xffF5C249).withOpacity(0.8),
                                ),
                              ),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF5C249).withOpacity(0.6),
                            ),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF5C249).withOpacity(0.8),
                            ),
                            validator: validatePassword,
                            isPassword: signUpController.hidePassword.value,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 18.h),

                  // -- Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xffF5C249).withOpacity(0.4),
                          thickness: 1.4,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF5C249).withOpacity(0.8),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xffF5C249).withOpacity(0.4),
                          thickness: 1.4,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18.h),

                  //-- social media login

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconBox(BImages.googleIc),
                      SizedBox(width: 18.w),
                      iconBox(BImages.facebookIc),
                      // SizedBox(width: 18.w),
                      // iconBox(BImages.appleIc),
                    ],
                  ),

                  SizedBox(height: 28.h),

                  //-- create ac button

                  AuthButton(
                    label: "Create an account",
                    icons: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      Loader.showLoader();
                      await signUpController.onCreateAccount();
                      Get.back();
                    },
                  ),

                  SizedBox(height: 18.h),

                  //--

                  Container(
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF5C249).withOpacity(0.6),
                        ),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            style: const TextStyle(
                              color: Color(0xffF5C249),
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Tap sign up");

                                Get.offNamed(AppRoutes.signinScreen);
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget iconBox(String icon) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        // color: Color(0xffF5C249).withOpacity(0.1),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Color(0xffF5C249).withOpacity(0.4),
        ),
      ),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.cover,
        height: 21.h,
        width: 21.w,
      ),
    );
  }
}
