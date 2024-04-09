import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                          33.33,
                          Color(0xffF5C249),
                          rankKey: 'completed',
                        ),
                        CircularSegmentEntry(
                          66.67,
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
                  holeLabel: '\$10.11',
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
              // Divider(
              //   color: Colors.grey.withOpacity(0.3),
              //   thickness: 1.4,
              // ),

              Expanded(
                child: Center(
                  child: Image.asset(
                    BImages.emptyBox,
                    fit: BoxFit.cover,
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
              ),
            ],
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
