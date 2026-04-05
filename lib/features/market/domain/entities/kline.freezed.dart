// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Kline {

@JsonKey(name: 't', fromJson: _dateTimeFromEpoch) DateTime get openTime;@JsonKey(name: 'o', fromJson: _doubleFromString) double get open;@JsonKey(name: 'h', fromJson: _doubleFromString) double get high;@JsonKey(name: 'l', fromJson: _doubleFromString) double get low;@JsonKey(name: 'c', fromJson: _doubleFromString) double get close;@JsonKey(name: 'x') bool get isClosed;
/// Create a copy of Kline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KlineCopyWith<Kline> get copyWith => _$KlineCopyWithImpl<Kline>(this as Kline, _$identity);

  /// Serializes this Kline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Kline&&(identical(other.openTime, openTime) || other.openTime == openTime)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openTime,open,high,low,close,isClosed);

@override
String toString() {
  return 'Kline(openTime: $openTime, open: $open, high: $high, low: $low, close: $close, isClosed: $isClosed)';
}


}

/// @nodoc
abstract mixin class $KlineCopyWith<$Res>  {
  factory $KlineCopyWith(Kline value, $Res Function(Kline) _then) = _$KlineCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 't', fromJson: _dateTimeFromEpoch) DateTime openTime,@JsonKey(name: 'o', fromJson: _doubleFromString) double open,@JsonKey(name: 'h', fromJson: _doubleFromString) double high,@JsonKey(name: 'l', fromJson: _doubleFromString) double low,@JsonKey(name: 'c', fromJson: _doubleFromString) double close,@JsonKey(name: 'x') bool isClosed
});




}
/// @nodoc
class _$KlineCopyWithImpl<$Res>
    implements $KlineCopyWith<$Res> {
  _$KlineCopyWithImpl(this._self, this._then);

  final Kline _self;
  final $Res Function(Kline) _then;

/// Create a copy of Kline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openTime = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? isClosed = null,}) {
  return _then(_self.copyWith(
openTime: null == openTime ? _self.openTime : openTime // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Kline].
extension KlinePatterns on Kline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Kline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Kline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Kline value)  $default,){
final _that = this;
switch (_that) {
case _Kline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Kline value)?  $default,){
final _that = this;
switch (_that) {
case _Kline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 't', fromJson: _dateTimeFromEpoch)  DateTime openTime, @JsonKey(name: 'o', fromJson: _doubleFromString)  double open, @JsonKey(name: 'h', fromJson: _doubleFromString)  double high, @JsonKey(name: 'l', fromJson: _doubleFromString)  double low, @JsonKey(name: 'c', fromJson: _doubleFromString)  double close, @JsonKey(name: 'x')  bool isClosed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Kline() when $default != null:
return $default(_that.openTime,_that.open,_that.high,_that.low,_that.close,_that.isClosed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 't', fromJson: _dateTimeFromEpoch)  DateTime openTime, @JsonKey(name: 'o', fromJson: _doubleFromString)  double open, @JsonKey(name: 'h', fromJson: _doubleFromString)  double high, @JsonKey(name: 'l', fromJson: _doubleFromString)  double low, @JsonKey(name: 'c', fromJson: _doubleFromString)  double close, @JsonKey(name: 'x')  bool isClosed)  $default,) {final _that = this;
switch (_that) {
case _Kline():
return $default(_that.openTime,_that.open,_that.high,_that.low,_that.close,_that.isClosed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 't', fromJson: _dateTimeFromEpoch)  DateTime openTime, @JsonKey(name: 'o', fromJson: _doubleFromString)  double open, @JsonKey(name: 'h', fromJson: _doubleFromString)  double high, @JsonKey(name: 'l', fromJson: _doubleFromString)  double low, @JsonKey(name: 'c', fromJson: _doubleFromString)  double close, @JsonKey(name: 'x')  bool isClosed)?  $default,) {final _that = this;
switch (_that) {
case _Kline() when $default != null:
return $default(_that.openTime,_that.open,_that.high,_that.low,_that.close,_that.isClosed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Kline implements Kline {
  const _Kline({@JsonKey(name: 't', fromJson: _dateTimeFromEpoch) required this.openTime, @JsonKey(name: 'o', fromJson: _doubleFromString) required this.open, @JsonKey(name: 'h', fromJson: _doubleFromString) required this.high, @JsonKey(name: 'l', fromJson: _doubleFromString) required this.low, @JsonKey(name: 'c', fromJson: _doubleFromString) required this.close, @JsonKey(name: 'x') required this.isClosed});
  factory _Kline.fromJson(Map<String, dynamic> json) => _$KlineFromJson(json);

@override@JsonKey(name: 't', fromJson: _dateTimeFromEpoch) final  DateTime openTime;
@override@JsonKey(name: 'o', fromJson: _doubleFromString) final  double open;
@override@JsonKey(name: 'h', fromJson: _doubleFromString) final  double high;
@override@JsonKey(name: 'l', fromJson: _doubleFromString) final  double low;
@override@JsonKey(name: 'c', fromJson: _doubleFromString) final  double close;
@override@JsonKey(name: 'x') final  bool isClosed;

/// Create a copy of Kline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KlineCopyWith<_Kline> get copyWith => __$KlineCopyWithImpl<_Kline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KlineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Kline&&(identical(other.openTime, openTime) || other.openTime == openTime)&&(identical(other.open, open) || other.open == open)&&(identical(other.high, high) || other.high == high)&&(identical(other.low, low) || other.low == low)&&(identical(other.close, close) || other.close == close)&&(identical(other.isClosed, isClosed) || other.isClosed == isClosed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openTime,open,high,low,close,isClosed);

@override
String toString() {
  return 'Kline(openTime: $openTime, open: $open, high: $high, low: $low, close: $close, isClosed: $isClosed)';
}


}

/// @nodoc
abstract mixin class _$KlineCopyWith<$Res> implements $KlineCopyWith<$Res> {
  factory _$KlineCopyWith(_Kline value, $Res Function(_Kline) _then) = __$KlineCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 't', fromJson: _dateTimeFromEpoch) DateTime openTime,@JsonKey(name: 'o', fromJson: _doubleFromString) double open,@JsonKey(name: 'h', fromJson: _doubleFromString) double high,@JsonKey(name: 'l', fromJson: _doubleFromString) double low,@JsonKey(name: 'c', fromJson: _doubleFromString) double close,@JsonKey(name: 'x') bool isClosed
});




}
/// @nodoc
class __$KlineCopyWithImpl<$Res>
    implements _$KlineCopyWith<$Res> {
  __$KlineCopyWithImpl(this._self, this._then);

  final _Kline _self;
  final $Res Function(_Kline) _then;

/// Create a copy of Kline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? openTime = null,Object? open = null,Object? high = null,Object? low = null,Object? close = null,Object? isClosed = null,}) {
  return _then(_Kline(
openTime: null == openTime ? _self.openTime : openTime // ignore: cast_nullable_to_non_nullable
as DateTime,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as double,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as double,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as double,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as double,isClosed: null == isClosed ? _self.isClosed : isClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
