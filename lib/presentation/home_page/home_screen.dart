import 'package:blockto_app/presentation/home/home_page.dart';
import 'package:blockto_app/presentation/home_page/home_screen_controller.dart';
import 'package:blockto_app/widget/home_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppbarWidget(
        homeController: homeScreenController,
      ),
      body: Obx(() {
        if (homeScreenController.tabIndex.value == 0) {
          return HomePage();
        }
        return SizedBox();
      }),
    );
  }
}
