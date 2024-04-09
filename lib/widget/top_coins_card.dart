import 'package:blockto_app/routes/app_routes.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopCoinsCard extends StatelessWidget {
  var item;
  TopCoinsCard({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.selectedCoinScreen, arguments: item),
      child: Container(
        width: 140.w,
        padding: EdgeInsets.only(top: 12.h, left: 10.w),
        margin: EdgeInsets.only(right: 22.h),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(18.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  item.image,
                  fit: BoxFit.cover,
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(width: 10.w),
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
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              '\$ ' + item.currentPrice.toString(),
              style: TextStyle(
                color: Color(0xffA7AEBF),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              item.marketCapChangePercentage24H < 0
                  ? '+ ${double.parse(item.marketCapChangePercentage24H.toStringAsFixed(2))}'
                  : '+ ${double.parse(item.marketCapChangePercentage24H.toStringAsFixed(2))}',
              style: TextStyle(
                color: item.marketCapChangePercentage24H < 0
                    ? Colors.red
                    : Colors.green,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 18.h),
            Container(
              // color: Colors.amber.withOpacity(0.3),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              height: 30.h,
              child: Sparkline(
                data: item.sparklineIn7D.price,
                lineWidth: 1.6,
                lineColor: item.marketCapChangePercentage24H >= 0
                    ? Colors.green
                    : Colors.red,

                // fillGradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: const [0.0, 0.7],
                //   // colors: item.marketCapChangePercentage24H >= 0
                //   //     ? [Colors.green.shade800, Colors.green.shade200]
                //   //     : [Colors.red.shade800, Colors.red.shade200],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
