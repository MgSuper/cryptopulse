// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketTicker _$MarketTickerFromJson(Map<String, dynamic> json) =>
    _MarketTicker(
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
      high24h: (json['high24h'] as num).toDouble(),
      low24h: (json['low24h'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$MarketTickerToJson(_MarketTicker instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'price': instance.price,
      'changePercent': instance.changePercent,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'volume': instance.volume,
      'timestamp': instance.timestamp.toIso8601String(),
    };
