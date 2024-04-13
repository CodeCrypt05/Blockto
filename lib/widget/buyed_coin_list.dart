import 'package:blockto_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BuyedCoinList extends StatelessWidget {
  final double coinBought;
  final String coinName;
  final String symbol;
  final double currentCoinValue;
  final String imageUrl;
  final double initialInvestment;
  const BuyedCoinList({
    super.key,
    required this.coinBought,
    required this.coinName,
    required this.symbol,
    required this.currentCoinValue,
    required this.imageUrl,
    required this.initialInvestment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(AppRoutes.selectedCoinScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(width: 14.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinName.length > 12
                          ? '${coinName.substring(0, 8)}...'
                          : coinName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      symbol.toString().toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Container(
            //   // color: Colors.amber.withOpacity(0.3),
            //   height: 30.h,
            //   width: 80.w,
            //   child: Sparkline(
            //     data: item.sparklineIn7D.price,
            //     lineWidth: 1.2,
            //     lineColor: item.marketCapChangePercentage24H >= 0
            //         ? Colors.green
            //         : Colors.red,
            //     // fillMode: FillMode.below,
            //     // fillGradient: LinearGradient(
            //     //   begin: Alignment.topCenter,
            //     //   end: Alignment.bottomCenter,
            //     //   stops: const [0.0, 0.7],
            //     //   colors: item.marketCapChangePercentage24H >= 0
            //     //       ? [Colors.green.shade800, Colors.green.shade200]
            //     //       : [Colors.red.shade800, Colors.red.shade200],
            //     // ),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$  $coinBought',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  // double.parse(currentCoinValue) < 0
                  //     ? currentCoinValue.toString()
                  '+ ' + currentCoinValue.toString(),
                  style: TextStyle(
                    color: currentCoinValue < 0 ? Colors.red : Colors.green,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
