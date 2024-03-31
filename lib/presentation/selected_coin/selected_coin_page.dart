import 'package:blockto_app/models/coin_chart_model.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectedCoinPage extends StatefulWidget {
  SelectedCoinPage({super.key});

  @override
  State<SelectedCoinPage> createState() => _SelectedCoinPageState();
}

class _SelectedCoinPageState extends State<SelectedCoinPage> {
  final selectedCoinPageController = Get.find<SelectedCoinPageController>();

  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic data = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // 'Bitcoin (BYC)',
                  '${data.name} (${data.symbol.toString().toUpperCase()})',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.network(
                  data.image,
                  fit: BoxFit.cover,
                  height: 40.h,
                  width: 40.w,
                ),
              ],
            ),
            Text(
              '\$ ' + data.currentPrice.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              data.marketCapChangePercentage24H < 0
                  ? data.marketCapChangePercentage24H.toString()
                  : '+ ' + data.marketCapChangePercentage24H.toString(),
              style: TextStyle(
                color: data.marketCapChangePercentage24H < 0
                    ? Colors.red
                    : Colors.green,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 200.h,
              width: double.infinity,
              color: Colors.blue.withOpacity(0.2),
              child: SfCartesianChart(
                trackballBehavior: trackballBehavior,
                zoomPanBehavior: ZoomPanBehavior(
                  enablePinching: true,
                  zoomMode: ZoomMode.x,
                ),
                series: <CandleSeries>[
                  CandleSeries<CoinChartModel, int>(
                    enableSolidCandles: true,
                    enableTooltip: true,
                    bullColor: Colors.green,
                    bearColor: Colors.red,
                    dataSource: selectedCoinPageController.coinChartList,
                    xValueMapper: (CoinChartModel sales, _) => sales.time,
                    lowValueMapper: (CoinChartModel sales, _) => sales.low,
                    highValueMapper: (CoinChartModel sales, _) => sales.high,
                    openValueMapper: (CoinChartModel sales, _) => sales.open,
                    closeValueMapper: (CoinChartModel sales, _) => sales.close,
                    animationDuration: 55,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
