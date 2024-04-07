import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:blockto_app/widget/custom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  final marketPageController = Get.find<MarketPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              // color: Colors.blueAccent,
              width: double.infinity,
              height: 36.h,
              child: CustomTabsBar(marketController: marketPageController),
            ),
          ],
        ),
      ),
    );
  }
}
