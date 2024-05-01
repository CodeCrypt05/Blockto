import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AbpoutUsScreen extends StatefulWidget {
  const AbpoutUsScreen({super.key});

  static const String welcomeMessage =
      "Welcome to Blockto, your premier destination for effortless crypto swapping and purchasing! At Blockto, we're committed to simplifying your crypto experience. Whether you're a seasoned trader or new to the world of digital assets, our platform offers intuitive tools and a user-friendly interface to empower your journey. With Blockto, you can seamlessly swap between various cryptocurrencies or buy your favorite coins hassle-free.";

  static const String aboutContent =
      "Our dedication to security and innovation ensures that your transactions are always safe and efficient. Join us today and discover the future of crypto trading with Blockto.";

  @override
  State<AbpoutUsScreen> createState() => _AbpoutUsScreenState();
}

class _AbpoutUsScreenState extends State<AbpoutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  BImages.appLogo,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 18.h),
              // const Text(
              //   "Blockto",
              //   style: TextStyle(
              //       fontSize: 24,
              //       fontStyle: FontStyle.normal,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white),
              // ),
              const SizedBox(
                height: 14,
              ),
              Container(
                margin: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  children: [
                    Text(
                      AbpoutUsScreen.welcomeMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.8)),
                    ),
                    SizedBox(height: 12.h),
                    // Text(
                    //   AbpoutUsScreen.missionStatement,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontSize: 14.sp, color: Colors.white.withOpacity(0.8)),
                    // ),
                    // SizedBox(height: 12.h),
                    Text(
                      AbpoutUsScreen.aboutContent,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                    SizedBox(height: 84.h),
                    Text(
                      "Version 1.0.1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8)),
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
