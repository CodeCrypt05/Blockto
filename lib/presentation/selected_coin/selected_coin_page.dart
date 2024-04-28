import 'package:blockto_app/data/network/network_service.dart';
import 'package:blockto_app/models/coin_chart_model.dart';
import 'package:blockto_app/presentation/no_internet_connection.dart';
import 'package:blockto_app/presentation/selected_coin/selected_coin_controller.dart';
import 'package:blockto_app/widget/selected_coin_bottom_appbar.dart';
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
  final networkController = Get.find<NetworkService>();

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
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 24.h,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SelectedCoinBottomAppbarWidget(
        item: data,
      ),
      body: Obx(
        () => networkController.connectionStatus.value == 1
            ? SingleChildScrollView(
                child: Container(
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
                            : '+ ' +
                                data.marketCapChangePercentage24H.toString(),
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
                        // color: Colors.blue.withOpacity(0.2),
                        child: Obx(
                          () => selectedCoinPageController.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xffF5C249),
                                  ),
                                )
                              : SfCartesianChart(
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
                                      dataSource: selectedCoinPageController
                                          .coinChartList,
                                      xValueMapper: (CoinChartModel sales, _) =>
                                          sales.time,
                                      lowValueMapper:
                                          (CoinChartModel sales, _) =>
                                              sales.low,
                                      highValueMapper:
                                          (CoinChartModel sales, _) =>
                                              sales.high,
                                      openValueMapper:
                                          (CoinChartModel sales, _) =>
                                              sales.open,
                                      closeValueMapper:
                                          (CoinChartModel sales, _) =>
                                              sales.close,
                                      animationDuration: 55,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xff757575).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              selectedCoinPageController.intervalMap.length,
                          itemBuilder: (context, index) {
                            String key = selectedCoinPageController
                                .intervalMap.keys
                                .elementAt(index);
                            return GestureDetector(
                              onTap: () async {
                                selectedCoinPageController.selectedIndex.value =
                                    index;
                                await selectedCoinPageController.getCoinChart(
                                    data.id,
                                    selectedCoinPageController
                                        .intervalMap.values
                                        .elementAt(selectedCoinPageController
                                            .selectedIndex.value));
                              },
                              child: Obx(
                                () => Container(
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.w),
                                  margin: EdgeInsets.symmetric(vertical: 6.h),
                                  decoration: BoxDecoration(
                                      color: selectedCoinPageController
                                                  .selectedIndex.value ==
                                              index
                                          ? Color(0xff757575).withOpacity(0.3)
                                          : null,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    key,
                                    style: TextStyle(
                                      color: selectedCoinPageController
                                                  .selectedIndex.value ==
                                              index
                                          ? Colors.white
                                          : const Color(0xff757575)
                                              .withOpacity(0.3),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'About ${data.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      aboutCoinData("Rank", data.marketCapRank.toString()),
                      aboutCoinData("Market Cap", data.marketCap.toString()),
                      aboutCoinData(
                          "Total Supply", data.totalSupply.toString()),
                      aboutCoinData("Max Supply", data.maxSupply.toString()),
                      aboutCoinData(
                          "Total Volume", data.totalVolume.toString()),
                      aboutCoinData("All Time High", data.high24H.toString()),
                      aboutCoinData("All Time Low", data.low24H.toString()),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              )
            : const NoInternetConnection(),
      ),
    );
  }

  Widget aboutCoinData(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
