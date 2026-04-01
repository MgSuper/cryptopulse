import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:equatable/equatable.dart';

class ChartState extends Equatable {
  final bool loading;
  final List<Candle> candles;

  const ChartState({required this.loading, required this.candles});

  factory ChartState.initial() {
    return const ChartState(loading: true, candles: []);
  }

  ChartState copyWith({bool? loading, List<Candle>? candles}) {
    return ChartState(
      loading: loading ?? this.loading,
      candles: candles ?? this.candles,
    );
  }

  @override
  List<Object?> get props => [loading, candles];
}
