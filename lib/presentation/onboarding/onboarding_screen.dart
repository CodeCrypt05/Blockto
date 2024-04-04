import 'package:blockto_app/presentation/onboarding/onboarding_screen_controller.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/widget/wide_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingScreenController = Get.find<OnBoardingScreenController>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Obx(() => onboardingScreenController.currentIndex.value == 0
                ? Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                    child: GestureDetector(
                      onTap: () {
                        onboardingScreenController.currentIndex.value++;
                        onboardingScreenController.controller.jumpToPage(
                            onboardingScreenController.currentIndex.value);
                      },
                      child: Container(
                        // color: Colors.pink,
                        height: 54.h,
                        child: WideButtonWidget(buttonTitle: 'Next'),
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                    child: Container(
                      // color: Colors.amber,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: onboardingScreenController
                                  .previousButtonClicked,
                              child: Container(
                                height: 54.h,
                                // margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: Color(0xffDB8C09)),
                                  color: Colors.black,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    "Previous",
                                    style: TextStyle(
                                        color: Color(0xffDB8C09),
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: GestureDetector(
                              onTap:
                                  onboardingScreenController.nextButtonClicked,
                              child: Container(
                                height: 54.h,
                                // margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffDB8C09),
                                        spreadRadius: -0.7.h,
                                        offset: Offset(0, 5)),
                                    // BoxShadow(
                                    //     color: Color(0xff3d2690),
                                    //     spreadRadius: -0.7.h,
                                    //     offset: Offset(0, 5)),
                                  ],
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Color(0xffDB8C09),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        body: Stack(
          children: [
            //background half circle
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.84,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                      top:
                          BorderSide(color: Color(0xffDB8C09).withOpacity(0.2)),
                      bottom:
                          BorderSide(color: Color(0xffDB8C09).withOpacity(0.2)),
                      left: BorderSide(
                          color: Color(0xffDB8C09).withOpacity(0.2))),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1000.r),
                    topLeft: Radius.circular(1000.r),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0xffDB8C09).withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1000.r),
                        topLeft: Radius.circular(1000.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //page content
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 56.h),
                  //skip text
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.homeScreen);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffDB8C09).withOpacity(0.6),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffDB8C09).withOpacity(0.6),
                      ),
                    ),
                  ),

                  //onboarding list
                  Expanded(
                    child: PageView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        controller: onboardingScreenController.controller,
                        itemCount:
                            onboardingScreenController.onboardingList.length,
                        onPageChanged: (value) {
                          onboardingScreenController.currentIndex.value = value;
                        },
                        itemBuilder: (ctx, index) {
                          return onboardingComponent(
                              onboardingScreenController
                                  .onboardingList[index].assets,
                              onboardingScreenController
                                  .onboardingList[index].title1,
                              onboardingScreenController
                                  .onboardingList[index].title2,
                              onboardingScreenController
                                  .onboardingList[index].subtitle,
                              context,
                              onboardingScreenController.currentIndex.value);
                        }),
                  ),

                  //for indicator
                  Padding(
                    padding: EdgeInsets.only(bottom: 180.h),
                    child: SmoothPageIndicator(
                        controller: onboardingScreenController.controller,
                        effect: ExpandingDotsEffect(
                            expansionFactor: 2.5,
                            dotHeight: 8.h,
                            dotWidth: 8.h,
                            activeDotColor: Colors.white,
                            dotColor: Colors.white.withOpacity(0.5)),
                        count: 4),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  //for scrollable onboarding list
  Widget onboardingComponent(image, title1, title2, subtitle, context, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 65.h),
          child: Center(
              child: Image.asset(image,
                  height: 220.h,
                  width:
                      index == 2 ? MediaQuery.of(context).size.width : 220.h)),
        ),
        Padding(
            padding: EdgeInsets.only(top: 55.h),
            child: Text(title1,
                style: TextStyle(
                    height: 1.1,
                    fontSize: 32.sp,
                    color: Color(0xffDB8C09).withOpacity(0.8)))),
        Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(title2,
                style: TextStyle(
                    height: 1.1, fontSize: 32.sp, color: Color(0xffDEDFF0)))),
        Text(subtitle,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.75))),
      ],
    );
  }
}
