import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/data/network/network_service.dart';
import 'package:blockto_app/presentation/no_internet_connection.dart';
import 'package:blockto_app/presentation/pages/portfolio/portfolio_page_controller.dart';
import 'package:blockto_app/widget/buyed_coin_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final portfolioPageController = Get.find<PortfolioPageController>();
  final FirebaseAuth auth = FirebaseService().auth;
  final networkController = Get.find<NetworkService>();

  @override
  Widget build(BuildContext context) {
    // var querySnapshot =
    //     portfolioPageController.GetBuyedCoinList().querySnapshot;
    Query<Map<String, dynamic>> querySnapshot = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('coins');
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => networkController.connectionStatus.value == 1
              ? SingleChildScrollView(
                  child: StreamBuilder(
                    stream: querySnapshot.snapshots(),
                    builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: 260.h),
                          child: Center(
                            child: Text(
                              "You don't have any holding! \nPlease buy some usdt to start swaping",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.data!.docs.isNotEmpty) {
                        print('data fetch successfully');
                        return Obx(
                          () => Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  child: AnimatedCircularChart(
                                    key: _chartKey,
                                    size: const Size(300.0, 300.0),
                                    initialChartData: <CircularStackEntry>[
                                      CircularStackEntry(
                                        <CircularSegmentEntry>[
                                          CircularSegmentEntry(
                                            portfolioPageController
                                                    .portfolioProfit.value /
                                                10,
                                            const Color(0xffF5C249),
                                            rankKey: 'completed',
                                          ),
                                          CircularSegmentEntry(
                                            100.0,
                                            Colors.grey[600],
                                            rankKey: 'remaining',
                                          ),
                                        ],
                                        rankKey: 'progress',
                                      ),
                                    ],
                                    chartType: CircularChartType.Radial,
                                    edgeStyle: SegmentEdgeStyle.round,
                                    percentageValues: true,
                                    holeLabel:
                                        '\$${portfolioPageController.portfolioProfit.toStringAsFixed(2)}',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     customButton('Withdraw',
                                //         Colors.grey.withOpacity(0.5), Colors.grey),
                                //     SizedBox(width: 24.w),
                                //     customButton('Deposit', const Color(0xffF5C249),
                                //         Colors.black),
                                //   ],
                                // ),
                                Text(
                                  "Coins you hold",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color(0xffFFFF).withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Map data = snapshot.data?.docs[index].data()
                                        as Map;
                                    return BuyedCoinList(
                                      index: index,
                                      coinBought: data['coin_bought'],
                                      coinName: data['coin_name'],
                                      symbol: data['coin_symbol'],
                                      currentCoinValue:
                                          data['current_coin_value'],
                                      imageUrl: data['img_link'],
                                      initialInvestment:
                                          data['initial_investment'],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                )
              : const NoInternetConnection(),
        ),
      ),
    );
  }

  Widget customButton(String label, Color backgroundColor, Color textColor) {
    return Expanded(
      child: Container(
        // height: 20.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(18.r)),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
