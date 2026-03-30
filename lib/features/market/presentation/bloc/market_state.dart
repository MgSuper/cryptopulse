import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:equatable/equatable.dart';

class MarketState extends Equatable {
  final Map<String, Ticker> tickers;
  final bool connected;

  const MarketState({required this.tickers, required this.connected});

  factory MarketState.initial() {
    return const MarketState(tickers: {}, connected: false);
  }

  MarketState copyWith({Map<String, Ticker>? tickers, bool? connected}) {
    return MarketState(
      tickers: tickers ?? this.tickers,
      connected: connected ?? this.connected,
    );
  }

  @override
  List<Object?> get props => [tickers, connected];
}
