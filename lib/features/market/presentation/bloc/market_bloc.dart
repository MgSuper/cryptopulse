import 'dart:async';

import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/domain/repositories/market_repository.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_event.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final MarketRepository repository;

  StreamSubscription? _subscription;

  MarketBloc(this.repository) : super(MarketState.initial()) {
    on<SubscribeMarket>(_onSubscribe);
    on<TickerUpdated>(_onTickerUpdated);
    on<MarketDisconnected>(_onDisconnected);
  }

  void _onSubscribe(SubscribeMarket event, Emitter<MarketState> emit) {
    _subscription?.cancel();

    _subscription = repository.subscribeTickers(event.symbols).listen((ticker) {
      add(
        TickerUpdated(
          symbol: ticker.symbol,
          price: ticker.price,
          changePercent: ticker.changePercent,
        ),
      );
    });

    emit(state.copyWith(connected: true));
  }

  void _onTickerUpdated(TickerUpdated event, Emitter<MarketState> emit) {
    final updated = Map<String, Ticker>.from(state.tickers);

    final existing = updated[event.symbol];

    if (existing == null) {
      updated[event.symbol] = Ticker(
        symbol: event.symbol,
        price: event.price,
        changePercent: event.changePercent,
        timestamp: DateTime.now(),
      );
    } else {
      updated[event.symbol] = existing.copyWith(
        price: event.price,
        timestamp: DateTime.now(),
        changePercent: event.changePercent,
      );
    }

    final history = Map<String, List<double>>.from(state.priceHistory);

    final list = history[event.symbol] ?? [];

    list.add(event.price);

    if (list.length > 30) {
      list.removeAt(0);
    }

    history[event.symbol] = list;

    emit(state.copyWith(tickers: updated, priceHistory: history));
  }

  void _onDisconnected(MarketDisconnected event, Emitter<MarketState> emit) {
    _subscription?.cancel();
    repository.disconnect();

    emit(state.copyWith(connected: false));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    repository.disconnect();
    return super.close();
  }
}
