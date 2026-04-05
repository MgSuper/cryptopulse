// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Candle _$CandleFromJson(Map<String, dynamic> json) => _Candle(
  open: (json['open'] as num).toDouble(),
  high: (json['high'] as num).toDouble(),
  low: (json['low'] as num).toDouble(),
  close: (json['close'] as num).toDouble(),
  time: DateTime.parse(json['time'] as String),
  volume: (json['volume'] as num).toDouble(),
);

Map<String, dynamic> _$CandleToJson(_Candle instance) => <String, dynamic>{
  'open': instance.open,
  'high': instance.high,
  'low': instance.low,
  'close': instance.close,
  'time': instance.time.toIso8601String(),
  'volume': instance.volume,
};
