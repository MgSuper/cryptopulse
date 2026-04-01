// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ticker {

 String get symbol; double get price; double get changePercent; DateTime get timestamp;
/// Create a copy of Ticker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TickerCopyWith<Ticker> get copyWith => _$TickerCopyWithImpl<Ticker>(this as Ticker, _$identity);

  /// Serializes this Ticker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ticker&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,price,changePercent,timestamp);

@override
String toString() {
  return 'Ticker(symbol: $symbol, price: $price, changePercent: $changePercent, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $TickerCopyWith<$Res>  {
  factory $TickerCopyWith(Ticker value, $Res Function(Ticker) _then) = _$TickerCopyWithImpl;
@useResult
$Res call({
 String symbol, double price, double changePercent, DateTime timestamp
});




}
/// @nodoc
class _$TickerCopyWithImpl<$Res>
    implements $TickerCopyWith<$Res> {
  _$TickerCopyWithImpl(this._self, this._then);

  final Ticker _self;
  final $Res Function(Ticker) _then;

/// Create a copy of Ticker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? price = null,Object? changePercent = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Ticker].
extension TickerPatterns on Ticker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ticker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ticker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ticker value)  $default,){
final _that = this;
switch (_that) {
case _Ticker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ticker value)?  $default,){
final _that = this;
switch (_that) {
case _Ticker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  double price,  double changePercent,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ticker() when $default != null:
return $default(_that.symbol,_that.price,_that.changePercent,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  double price,  double changePercent,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _Ticker():
return $default(_that.symbol,_that.price,_that.changePercent,_that.timestamp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  double price,  double changePercent,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _Ticker() when $default != null:
return $default(_that.symbol,_that.price,_that.changePercent,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ticker implements Ticker {
  const _Ticker({required this.symbol, required this.price, required this.changePercent, required this.timestamp});
  factory _Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);

@override final  String symbol;
@override final  double price;
@override final  double changePercent;
@override final  DateTime timestamp;

/// Create a copy of Ticker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TickerCopyWith<_Ticker> get copyWith => __$TickerCopyWithImpl<_Ticker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TickerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ticker&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.price, price) || other.price == price)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,price,changePercent,timestamp);

@override
String toString() {
  return 'Ticker(symbol: $symbol, price: $price, changePercent: $changePercent, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$TickerCopyWith<$Res> implements $TickerCopyWith<$Res> {
  factory _$TickerCopyWith(_Ticker value, $Res Function(_Ticker) _then) = __$TickerCopyWithImpl;
@override @useResult
$Res call({
 String symbol, double price, double changePercent, DateTime timestamp
});




}
/// @nodoc
class __$TickerCopyWithImpl<$Res>
    implements _$TickerCopyWith<$Res> {
  __$TickerCopyWithImpl(this._self, this._then);

  final _Ticker _self;
  final $Res Function(_Ticker) _then;

/// Create a copy of Ticker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? price = null,Object? changePercent = null,Object? timestamp = null,}) {
  return _then(_Ticker(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
