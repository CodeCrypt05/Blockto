import 'package:blockto_app/routes/app_routes.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CoinListStrucure extends StatelessWidget {
  var item;
  CoinListStrucure({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.selectedCoinScreen, arguments: item);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  item.image,
                  fit: BoxFit.cover,
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name.length > 8
                          ? '${item.name.substring(0, 8)}...'
                          : item.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      item.symbol.toString().toUpperCase(),
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
            Container(
              // color: Colors.amber.withOpacity(0.3),
              height: 30.h,
              width: 80.w,
              child: Sparkline(
                data: item.sparklineIn7D.price,
                lineWidth: 1.2,
                lineColor: item.marketCapChangePercentage24H >= 0
                    ? Colors.green
                    : Colors.red,
                // fillMode: FillMode.below,
                // fillGradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: const [0.0, 0.7],
                //   colors: item.marketCapChangePercentage24H >= 0
                //       ? [Colors.green.shade800, Colors.green.shade200]
                //       : [Colors.red.shade800, Colors.red.shade200],
                // ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$ ' + item.currentPrice.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item.marketCapChangePercentage24H < 0
                      ? item.marketCapChangePercentage24H.toString()
                      : '+ ' + item.marketCapChangePercentage24H.toString(),
                  style: TextStyle(
                    color: item.marketCapChangePercentage24H < 0
                        ? Colors.red
                        : Colors.green,
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
