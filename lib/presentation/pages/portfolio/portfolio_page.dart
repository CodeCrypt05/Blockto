import 'package:blockto_app/data/firebase_services/firebase_services.dart';
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
                          const CircularSegmentEntry(
                            100.0,
                            Color(0xffF5C249),
                            rankKey: 'completed',
                          ),
                          CircularSegmentEntry(
                            0.0,
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
                        '\$${portfolioPageController.totalInitialInvestment.value}',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customButton(
                        'Withdraw', Colors.grey.withOpacity(0.5), Colors.grey),
                    SizedBox(width: 24.w),
                    customButton(
                        'Deposit', const Color(0xffF5C249), Colors.black),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: StreamBuilder(
                    stream: querySnapshot.snapshots(),
                    builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.data!.docs.isNotEmpty) {
                        print('data fetch successfully');
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Map data = snapshot.data?.docs[index].data() as Map;
                            print('lenght: ${snapshot.data!.docs.length}');

                            return BuyedCoinList(
                              coinBought: data['coin_bought'],
                              coinName: data['coin_name'],
                              symbol: data['coin_symbol'],
                              currentCoinValue: data['current_coin_value'],
                              imageUrl: data['img_link'],
                              initialInvestment: data['initial_investment'],
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
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
