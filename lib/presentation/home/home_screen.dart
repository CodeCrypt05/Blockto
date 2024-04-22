import 'package:blockto_app/presentation/home/home_screen_controller.dart';
import 'package:blockto_app/presentation/pages/home/home_page.dart';
import 'package:blockto_app/presentation/pages/market/market_page.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:blockto_app/widget/home_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.emptyNotificationScreen),
              child: Container(
                // color: Colors.amber,
                padding: EdgeInsets.only(right: 22.w),
                child: Image.asset(
                  BImages.notificationIc,
                  fit: BoxFit.cover,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppbarWidget(
          homeController: homeScreenController,
        ),
        body: Obx(() {
          if (homeScreenController.tabIndex.value == 0) {
            return HomePage();
          } else if (homeScreenController.tabIndex.value == 1) {
            return MarketPage();
          } else if (homeScreenController.tabIndex.value == 2) {
            return PortfolioPage();
          } else if (homeScreenController.tabIndex.value == 3) {
            return SettingPage();
          }

          return const SizedBox();
        }),
      ),
    );
  }
}
