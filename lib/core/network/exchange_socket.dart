import 'dart:async';

/// Abstract interface for WebSocket-based exchanges.
///
/// Expert Tip: We use a generic interface to allow for future
/// data types beyond just a raw Map.
abstract class ExchangeSocket {
  /// Connects to the exchange and returns a broadcast stream of updates.
  ///
  /// [symbols] are the trading pairs (e.g., ['BTCUSDT', 'ETHUSDT']).
  Stream<Map<String, dynamic>> connect({required List<String> symbols});

  Stream<Map<String, dynamic>> connectKline({
    required String symbol,
    String interval = "1m",
  });

  /// Closes the connection and releases all resources (Sinks, Controllers).
  ///
  /// Always call this when the Bloc/Provider is disposed to prevent memory leaks.
  Future<void> disconnect();

  /// Optional: An expert adds a getter to check connection status.
  bool get isConnected;
}
