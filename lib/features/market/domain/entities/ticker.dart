import 'package:freezed_annotation/freezed_annotation.dart';
part 'ticker.freezed.dart';
part 'ticker.g.dart';

@freezed
sealed class Ticker with _$Ticker {
  const factory Ticker({
    required String symbol,
    required double price,
    required double changePercent,
    required DateTime timestamp,
  }) = _Ticker;

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);
}
