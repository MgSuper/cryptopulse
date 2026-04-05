// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Kline _$KlineFromJson(Map<String, dynamic> json) => _Kline(
  openTime: _dateTimeFromEpoch((json['t'] as num).toInt()),
  open: _doubleFromString(json['o'] as String),
  high: _doubleFromString(json['h'] as String),
  low: _doubleFromString(json['l'] as String),
  close: _doubleFromString(json['c'] as String),
  isClosed: json['x'] as bool,
);

Map<String, dynamic> _$KlineToJson(_Kline instance) => <String, dynamic>{
  't': instance.openTime.toIso8601String(),
  'o': instance.open,
  'h': instance.high,
  'l': instance.low,
  'c': instance.close,
  'x': instance.isClosed,
};
