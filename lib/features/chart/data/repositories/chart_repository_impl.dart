import 'package:cryptopulse/features/chart/data/datasources/binance_chart_api.dart';
import 'package:cryptopulse/features/chart/domain/repositories/chart_repository.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChartRepository)
class ChartRepositoryImpl implements ChartRepository {
  final BinanceChartApi api;

  ChartRepositoryImpl(this.api);

  @override
  Future<List<Candle>> getCandles({
    required String symbol,
    required String interval,
  }) async {
    final data = await api.getKlines(symbol: symbol, interval: interval);

    return data.map<Candle>((k) {
      return Candle(
        time: DateTime.fromMillisecondsSinceEpoch(k[0]),
        open: double.parse(k[1]),
        high: double.parse(k[2]),
        low: double.parse(k[3]),
        close: double.parse(k[4]),
      );
    }).toList();
  }
}
