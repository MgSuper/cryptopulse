import 'dart:async';

import 'package:cryptopulse/core/network/exchange_socket.dart';
import 'package:cryptopulse/features/chart/domain/repositories/chart_repository.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_event.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_state.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final ChartRepository repository;
  final ExchangeSocket _socket;
  StreamSubscription? _subscription;

  ChartBloc(this.repository, this._socket) : super(ChartState.initial()) {
    on<LoadChart>(_onLoadChart);
    on<KlineUpdate>(_onKlineUpdate);
  }

  Future<void> _onLoadChart(LoadChart event, Emitter<ChartState> emit) async {
    await _subscription?.cancel();
    emit(state.copyWith(loading: true));

    final candles = await repository.getCandles(
      symbol: event.symbol,
      interval: '1m',
    );

    emit(state.copyWith(loading: false, candles: candles));

    _subscription = _socket
        .connectKline(symbol: event.symbol, interval: '1m')
        .listen((data) {
          add(KlineUpdate(data));
        });
  }

  void _onKlineUpdate(KlineUpdate event, Emitter<ChartState> emit) {
    final data = event.data;

    final k = data['k'];

    if (k is! Map<String, dynamic>) return;

    final candle = Candle(
      time: DateTime.fromMillisecondsSinceEpoch(k['t']),
      open: double.parse(k['o']),
      high: double.parse(k['h']),
      low: double.parse(k['l']),
      close: double.parse(k['c']),
      volume: double.parse(k['v']),
    );

    final candles = List<Candle>.from(state.candles);

    if (candles.isEmpty) return;

    final last = candles.last;

    if (last.time == candle.time) {
      candles[candles.length - 1] = candle;
    } else {
      candles.add(candle);

      if (candles.length > 100) {
        candles.removeAt(0);
      }
    }

    emit(state.copyWith(candles: candles));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
