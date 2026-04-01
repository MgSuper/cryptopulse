// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ticker _$TickerFromJson(Map<String, dynamic> json) => _Ticker(
  symbol: json['symbol'] as String,
  price: (json['price'] as num).toDouble(),
  changePercent: (json['changePercent'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$TickerToJson(_Ticker instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'price': instance.price,
  'changePercent': instance.changePercent,
  'timestamp': instance.timestamp.toIso8601String(),
};
