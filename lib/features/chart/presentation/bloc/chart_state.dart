import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:equatable/equatable.dart';

class ChartState extends Equatable {
  final bool loading;
  final List<Candle> candles;
  // final double? livePrice;

  const ChartState({
    required this.loading,
    required this.candles,
    // this.livePrice,
  });

  factory ChartState.initial() {
    return const ChartState(loading: true, candles: []);
  }

  ChartState copyWith({
    bool? loading,
    List<Candle>? candles,
    // double? livePrice,
  }) {
    return ChartState(
      loading: loading ?? this.loading,
      candles: candles ?? this.candles,
      // livePrice: livePrice ?? this.livePrice,
    );
  }

  @override
  List<Object?> get props => [loading, candles];
}
