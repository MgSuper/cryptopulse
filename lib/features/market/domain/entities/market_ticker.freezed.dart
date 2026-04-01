// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_ticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketTicker {

 String get symbol; double get price; double get changePercent; double get high24h; double get low24h; double get volume; DateTime get timestamp;
/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketTickerCopyWith<MarketTicker> get copyWith => _$MarketTickerCopyWithImpl<MarketTicker>(this as MarketTicker, _$identity);

  /// Serializes this MarketTicker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketTicker&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,price,changePercent,high24h,low24h,volume,timestamp);

@override
String toString() {
  return 'MarketTicker(symbol: $symbol, price: $price, changePercent: $changePercent, high24h: $high24h, low24h: $low24h, volume: $volume, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $MarketTickerCopyWith<$Res>  {
  factory $MarketTickerCopyWith(MarketTicker value, $Res Function(MarketTicker) _then) = _$MarketTickerCopyWithImpl;
@useResult
$Res call({
 String symbol, double price, double changePercent, double high24h, double low24h, double volume, DateTime timestamp
});




}
/// @nodoc
class _$MarketTickerCopyWithImpl<$Res>
    implements $MarketTickerCopyWith<$Res> {
  _$MarketTickerCopyWithImpl(this._self, this._then);

  final MarketTicker _self;
  final $Res Function(MarketTicker) _then;

/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? price = null,Object? changePercent = null,Object? high24h = null,Object? low24h = null,Object? volume = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,high24h: null == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double,low24h: null == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketTicker].
extension MarketTickerPatterns on MarketTicker {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketTicker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketTicker value)  $default,){
final _that = this;
switch (_that) {
case _MarketTicker():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketTicker value)?  $default,){
final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  double price,  double changePercent,  double high24h,  double low24h,  double volume,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
return $default(_that.symbol,_that.price,_that.changePercent,_that.high24h,_that.low24h,_that.volume,_that.timestamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  double price,  double changePercent,  double high24h,  double low24h,  double volume,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _MarketTicker():
return $default(_that.symbol,_that.price,_that.changePercent,_that.high24h,_that.low24h,_that.volume,_that.timestamp);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  double price,  double changePercent,  double high24h,  double low24h,  double volume,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _MarketTicker() when $default != null:
return $default(_that.symbol,_that.price,_that.changePercent,_that.high24h,_that.low24h,_that.volume,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketTicker implements MarketTicker {
  const _MarketTicker({required this.symbol, required this.price, required this.changePercent, required this.high24h, required this.low24h, required this.volume, required this.timestamp});
  factory _MarketTicker.fromJson(Map<String, dynamic> json) => _$MarketTickerFromJson(json);

@override final  String symbol;
@override final  double price;
@override final  double changePercent;
@override final  double high24h;
@override final  double low24h;
@override final  double volume;
@override final  DateTime timestamp;

/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketTickerCopyWith<_MarketTicker> get copyWith => __$MarketTickerCopyWithImpl<_MarketTicker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketTickerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketTicker&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.high24h, high24h) || other.high24h == high24h)&&(identical(other.low24h, low24h) || other.low24h == low24h)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,price,changePercent,high24h,low24h,volume,timestamp);

@override
String toString() {
  return 'MarketTicker(symbol: $symbol, price: $price, changePercent: $changePercent, high24h: $high24h, low24h: $low24h, volume: $volume, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$MarketTickerCopyWith<$Res> implements $MarketTickerCopyWith<$Res> {
  factory _$MarketTickerCopyWith(_MarketTicker value, $Res Function(_MarketTicker) _then) = __$MarketTickerCopyWithImpl;
@override @useResult
$Res call({
 String symbol, double price, double changePercent, double high24h, double low24h, double volume, DateTime timestamp
});




}
/// @nodoc
class __$MarketTickerCopyWithImpl<$Res>
    implements _$MarketTickerCopyWith<$Res> {
  __$MarketTickerCopyWithImpl(this._self, this._then);

  final _MarketTicker _self;
  final $Res Function(_MarketTicker) _then;

/// Create a copy of MarketTicker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? price = null,Object? changePercent = null,Object? high24h = null,Object? low24h = null,Object? volume = null,Object? timestamp = null,}) {
  return _then(_MarketTicker(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,high24h: null == high24h ? _self.high24h : high24h // ignore: cast_nullable_to_non_nullable
as double,low24h: null == low24h ? _self.low24h : low24h // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
