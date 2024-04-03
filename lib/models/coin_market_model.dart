// To parse this JSON data, do
//
//     final coinMarketModel = coinMarketModelFromJson(jsonString);

import 'dart:convert';

CoinMarketModel coinMarketModelFromJson(String str) =>
    CoinMarketModel.fromJson(json.decode(str));

String coinMarketModelToJson(CoinMarketModel data) =>
    json.encode(data.toJson());

class CoinMarketModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  int? marketCap;
  int? marketCapRank;
  // int? fullyDilutedValuation;
  double? totalVolume;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  // double? priceChangePercentage24H;
  // int? marketCapChange24H;
  double? marketCapChangePercentage24H;
  double? totalSupply;
  double? maxSupply;
  // int? ath;
  // double? athChangePercentage;
  // DateTime? athDate;
  // double? atl;
  // double? atlChangePercentage;
  // DateTime? atlDate;
  // dynamic roi;
  // DateTime? lastUpdated;
  SparklineIn7D? sparklineIn7D;

  CoinMarketModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    // this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    // this.priceChangePercentage24H,
    // this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.totalSupply,
    this.maxSupply,
    // this.ath,
    // this.athChangePercentage,
    // this.athDate,
    // this.atl,
    // this.atlChangePercentage,
    // this.atlDate,
    // this.roi,
    // this.lastUpdated,
    this.sparklineIn7D,
  });

  factory CoinMarketModel.fromJson(Map<String, dynamic> json) =>
      CoinMarketModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        // fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"]?.toDouble(),
        high24H: json["high_24h"]?.toDouble(),
        low24H: json["low_24h"]?.toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        // priceChangePercentage24H:
        //     json["price_change_percentage_24h"]?.toDouble(),
        // marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        maxSupply: json["max_supply"]?.toDouble(),
        // ath: json["ath"],
        // athChangePercentage: json["ath_change_percentage"]?.toDouble(),
        // athDate:
        //     json["ath_date"] == null ? null : DateTime.parse(json["ath_date"]),
        // atl: json["atl"]?.toDouble(),
        // atlChangePercentage: json["atl_change_percentage"]?.toDouble(),
        // atlDate:
        //     json["atl_date"] == null ? null : DateTime.parse(json["atl_date"]),
        // roi: json["roi"],
        // lastUpdated: json["last_updated"] == null
        //     ? null
        //     : DateTime.parse(json["last_updated"]),
        // sparklineIn7D: SparklineIn7D.fromJson(json["sparkline_in_7d"]),
        sparklineIn7D: json["sparkline_in_7d"] == null
            ? null
            : SparklineIn7D.fromJson(json["sparkline_in_7d"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        // "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        // "price_change_percentage_24h": priceChangePercentage24H,
        // "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        // "ath": ath,
        // "ath_change_percentage": athChangePercentage,
        // "ath_date": athDate?.toIso8601String(),
        // "atl": atl,
        // "atl_change_percentage": atlChangePercentage,
        // "atl_date": atlDate?.toIso8601String(),
        // "roi": roi,
        // "last_updated": lastUpdated?.toIso8601String(),
        "sparkline_in_7d": sparklineIn7D?.toJson(),
      };
}

class SparklineIn7D {
  List<double>? price;

  SparklineIn7D({
    this.price,
  });

  factory SparklineIn7D.fromJson(Map<String, dynamic> json) => SparklineIn7D(
        price: json["price"] == null
            ? []
            : List<double>.from(json["price"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? [] : List<dynamic>.from(price!.map((x) => x)),
      };
}
