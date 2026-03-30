import 'package:cryptopulse/features/market/domain/entities/ticker.dart';

abstract class MarketRepository {
  Stream<Ticker> subscribeTickers(List<String> symbols);

  void disconnect();
}
