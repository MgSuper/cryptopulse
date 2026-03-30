import 'package:cryptopulse/core/network/exchange_socket.dart';
import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/domain/repositories/market_repository.dart';

class MarketRepositoryImpl implements MarketRepository {
  final ExchangeSocket socket;

  MarketRepositoryImpl(this.socket);

  @override
  Stream<Ticker> subscribeTickers(List<String> symbols) {
    final stream = socket.connect(symbols: symbols);

    return stream.map((data) {
      return Ticker(
        symbol: data['s'],
        price: double.parse(data['p']),
        timestamp: DateTime.fromMillisecondsSinceEpoch(data['E']),
      );
    });
  }

  @override
  void disconnect() {
    socket.disconnect();
  }
}
