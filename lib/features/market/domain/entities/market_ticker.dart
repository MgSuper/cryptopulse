import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_ticker.freezed.dart';
part 'market_ticker.g.dart';

@freezed
sealed class MarketTicker with _$MarketTicker {
  const factory MarketTicker({
    required String symbol,
    required double price,
    required double changePercent,
    required double high24h,
    required double low24h,
    required double volume,
    required DateTime timestamp,
  }) = _MarketTicker;

  factory MarketTicker.fromJson(Map<String, dynamic> json) =>
      _$MarketTickerFromJson(json);
}
