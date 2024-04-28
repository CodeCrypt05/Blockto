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
  final int index;
  const BuyedCoinList({
    super.key,
    required this.coinBought,
    required this.coinName,
    required this.symbol,
    required this.currentCoinValue,
    required this.imageUrl,
    required this.initialInvestment,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (symbol.toString() != 'usdt') {
          Get.toNamed(AppRoutes.sellCoinScreen, arguments: [
            coinBought,
            coinName,
            symbol,
            currentCoinValue,
            imageUrl,
            initialInvestment,
          ]);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 30.h,
                        width: 30.w,
                      )
                    : Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/4/46/Bitcoin.svg',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  coinBought.toStringAsFixed(2),
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
