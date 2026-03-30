import 'package:equatable/equatable.dart';

abstract class MarketEvent extends Equatable {
  const MarketEvent();

  @override
  List<Object?> get props => [];
}

class SubscribeMarket extends MarketEvent {
  final List<String> symbols;

  const SubscribeMarket(this.symbols);

  @override
  List<Object?> get props => [symbols];
}

class TickerUpdated extends MarketEvent {
  final String symbol;
  final double price;

  const TickerUpdated({required this.symbol, required this.price});

  @override
  List<Object?> get props => [symbol, price];
}

class MarketDisconnected extends MarketEvent {}
