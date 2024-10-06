class CoinChartModel {
  int time;
  double? open;
  double? high;
  double? low;
  double? close;

  CoinChartModel(
      {required this.time, this.open, this.high, this.low, this.close});

  factory CoinChartModel.fromJson(List l) {
    return CoinChartModel(
      time: l[0],
      open: l[1],
      high: l[2],
      low: l[3],
      close: l[4],
    );
  }
}
