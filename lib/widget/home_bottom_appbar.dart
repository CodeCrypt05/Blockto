import 'package:blockto_app/presentation/home_page/home_screen_controller.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class BottomAppbarWidget extends StatelessWidget {
  BottomAppbarWidget({super.key, required this.homeController});

  final HomeScreenController homeController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.black,
      color: Color(0xff262932).withOpacity(0.8),
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            bottomIconContainer(BImages.homeIc, 'Home', 0),
            bottomIconContainer(BImages.marketIc, 'Market', 1),
            bottomIconContainer(BImages.portfolioIc, 'Portfolio', 2),
            bottomIconContainer(BImages.settingIc, 'Setting', 3),
          ],
        ),
      ),
    );
  }

  Widget bottomIconContainer(
    String icImage,
    String title,
    int index,
  ) {
    return Obx(
      () => InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(42.r)),
        onTap: () {
          print(index);
          homeController.changeTabIndex(index);
        },
        child: Container(
          // color: Colors.blue.withOpacity(0.3),
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          height: 50.h,
          child: Column(
            children: [
              SvgPicture.asset(
                icImage,
                height: 26.h,
                width: 26.w,
                color: index == homeController.tabIndex.value
                    ? Color(0xffF5C249)
                    : Color(0xff787A8D),
              ),
              SizedBox(height: 2.h),
              Text(
                title,
                style: TextStyle(
                  color: index == homeController.tabIndex.value
                      ? Color(0xffF5C249)
                      : Color(0xff787A8D),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
