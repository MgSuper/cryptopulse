import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:equatable/equatable.dart';

class MarketState extends Equatable {
  final Map<String, Ticker> tickers;
  final Map<String, List<double>> priceHistory;
  final bool connected;

  const MarketState({
    required this.tickers,
    required this.priceHistory,
    required this.connected,
  });

  factory MarketState.initial() {
    return const MarketState(tickers: {}, priceHistory: {}, connected: false);
  }

  MarketState copyWith({
    Map<String, Ticker>? tickers,
    Map<String, List<double>>? priceHistory,
    bool? connected,
  }) {
    return MarketState(
      tickers: tickers ?? this.tickers,
      priceHistory: priceHistory ?? this.priceHistory,
      connected: connected ?? this.connected,
    );
  }

  @override
  List<Object?> get props => [tickers, priceHistory, connected];
}
