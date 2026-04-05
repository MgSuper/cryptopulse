import 'package:freezed_annotation/freezed_annotation.dart';

part 'kline.freezed.dart';
part 'kline.g.dart';

@freezed
sealed class Kline with _$Kline {
  const factory Kline({
    @JsonKey(name: 't', fromJson: _dateTimeFromEpoch)
    required DateTime openTime,
    @JsonKey(name: 'o', fromJson: _doubleFromString) required double open,
    @JsonKey(name: 'h', fromJson: _doubleFromString) required double high,
    @JsonKey(name: 'l', fromJson: _doubleFromString) required double low,
    @JsonKey(name: 'c', fromJson: _doubleFromString) required double close,
    @JsonKey(name: 'x') required bool isClosed,
  }) = _Kline;

  // This line forces the .g.dart generation
  factory Kline.fromJson(Map<String, dynamic> json) => _$KlineFromJson(json);
}

// Helper functions for the generator
DateTime _dateTimeFromEpoch(int ms) => DateTime.fromMillisecondsSinceEpoch(ms);
double _doubleFromString(String val) => double.parse(val);
