import 'package:equatable/equatable.dart';

sealed class ChartEvent extends Equatable {
  const ChartEvent();
  @override
  List<Object?> get props => [];
}

class LoadChart extends ChartEvent {
  final String symbol;
  const LoadChart(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

class KlineUpdate extends ChartEvent {
  final Map<String, dynamic> data;

  const KlineUpdate(this.data);

  @override
  List<Object?> get props => [data];
}
