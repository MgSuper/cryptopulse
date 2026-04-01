import 'package:cryptopulse/features/market/domain/entities/candle.dart';

abstract class ChartRepository {
  Future<List<Candle>> getCandles({
    required String symbol,
    required String interval,
  });
}
