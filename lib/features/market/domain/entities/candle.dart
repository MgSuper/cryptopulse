import 'package:freezed_annotation/freezed_annotation.dart';

part 'candle.freezed.dart';
part 'candle.g.dart';

@freezed
sealed class Candle with _$Candle {
  const factory Candle({
    required double open,
    required double high,
    required double low,
    required double close,
    required DateTime time,
    required double volume,
  }) = _Candle;

  factory Candle.fromJson(Map<String, dynamic> json) => _$CandleFromJson(json);
}
