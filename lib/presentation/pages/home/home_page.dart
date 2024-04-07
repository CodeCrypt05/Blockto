import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:blockto_app/widget/news_card.dart';
import 'package:blockto_app/widget/top_coins_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Container(
                  height: 230.w,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        width: 360.w,
                        BImages.cryptoCard,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        // color: Colors.blue.withOpacity(0.2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  // width: double.infinity,
                                  padding:
                                      EdgeInsets.only(top: 70.h, left: 30.w),
                                  // color: Colors.red.withOpacity(0.2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Balance',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        '\$18,368.11',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 40.h, left: 10.w),
                                  child: Image.asset(
                                    BImages.smallBitCoin,
                                    fit: BoxFit.cover,
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 30.h, left: 30.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        '\$ 1,368',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "  Today's Profit",
                                        style: TextStyle(
                                          color: Color(0xff494D58),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 40.w),
                                  child: Image.asset(
                                    BImages.bigBitCoin,
                                    fit: BoxFit.cover,
                                    height: 70.h,
                                    width: 70.w,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Coins',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: const Color(0xffF5C249),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 170.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(3.h),
                  // color: Colors.blue.withOpacity(0.3),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TopCoinsCard(
                        item: homePageController.coinMarketList[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: const Color(0xffF5C249),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        item: homePageController.newsDataList[index],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
