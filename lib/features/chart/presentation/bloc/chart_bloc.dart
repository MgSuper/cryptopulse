import 'package:cryptopulse/features/chart/domain/repositories/chart_repository.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_event.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final ChartRepository repository;

  ChartBloc(this.repository) : super(ChartState.initial()) {
    on<LoadChart>(_onLoadChart);
  }

  Future<void> _onLoadChart(LoadChart event, Emitter<ChartState> emit) async {
    emit(state.copyWith(loading: true));

    final candles = await repository.getCandles(
      symbol: event.symbol,
      interval: "5m",
    );

    emit(state.copyWith(loading: false, candles: candles));
  }
}
