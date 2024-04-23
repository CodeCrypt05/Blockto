import 'package:blockto_app/data/network/network_service.dart';
import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:blockto_app/widget/coin_list_structure.dart';
import 'package:blockto_app/widget/custom_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  final marketPageController = Get.find<MarketPageController>();
  final homePageController = Get.find<HomePageController>();
  final networkController = Get.find<NetworkService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              SizedBox(
                // color: Colors.blueAccent,
                width: double.infinity,
                height: 36.h,
                child: CustomTabsBar(marketController: marketPageController),
              ),
              SizedBox(height: 18.h),
              marketPageController.position.value == 0
                  ? allCoins(homePageController.coinMarketList)
                  : marketPageController.position.value == 1
                      ? watchList()
                      : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  //----
  Widget allCoins(List coinList) {
    return Expanded(
      child: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: coinList.length,
        itemBuilder: (context, index) {
          return CoinListStrucure(
            item: coinList[index],
          );
        },
      ),
    );
  }

  Widget watchList() {
    return Expanded(
      child: Center(
        child: Text(
          'Nothing Here',
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
    );
  }
}
