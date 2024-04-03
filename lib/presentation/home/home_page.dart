import 'package:blockto_app/presentation/home/home_controller.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:blockto_app/widget/appdrwaer.dart';
import 'package:blockto_app/widget/home_bottom_appbar.dart';
import 'package:blockto_app/widget/coin_list_structure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeScreenController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white.withOpacity(0.9),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white.withOpacity(0.9),
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawerWidget(),
      bottomNavigationBar: const BottomAppbarWidget(),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    // color: Colors.amberAccent,
                    // margin: EdgeInsets.symmetric(horizontal: 20.h),
                    padding: EdgeInsets.only(left: 18.w, top: 18.h),
                    alignment: AlignmentDirectional.center,
                    child: SvgPicture.asset(
                      BImages.cryptoCard,
                      fit: BoxFit.fill,
                      alignment: AlignmentDirectional.center,
                      height: 200.h,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // color: Colors.red.shade100,
                    padding: EdgeInsets.only(left: 32.w, top: 32.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '9.2365 ETH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "\$ 16,454.34",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          // color: Colors.red.shade100,
                          width: double.infinity,
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(right: 44.h, top: 56.h),
                          child: Text(
                            "+ 9.0%",
                            style: TextStyle(
                              color: const Color(0xFF14FF00),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(BImages.sentIc, "Sent"),
                  buildButton(BImages.reciveIc, "Recive"),
                  buildButton(BImages.buyIc, "Buy"),
                ],
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        homeScreenController.tabController.value = false;
                      },
                      child: Text(
                        'Coin',
                        style: TextStyle(
                          color: homeScreenController.tabController.value
                              ? Colors.grey
                              : Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.h),
                    InkWell(
                      onTap: () {
                        homeScreenController.tabController.value = true;
                      },
                      child: Text(
                        'Watchlist',
                        style: TextStyle(
                          color: homeScreenController.tabController.value
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              homeScreenController.tabController.value
                  ? Center(
                      child: Text(
                        'Empty Watchlist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : homeScreenController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeScreenController.coinMarketList.length,
                          itemBuilder: (context, index) {
                            return CoinListStrucure(
                              item: homeScreenController.coinMarketList[index],
                            );
                          },
                        ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String icImage, String icName) {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          color: const Color(0xff202832),
          borderRadius: BorderRadius.circular(26.r)),
      child: Row(
        children: [
          SvgPicture.asset(
            icImage,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.w),
          Text(
            icName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
