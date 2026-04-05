import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BinanceChartApi {
  final Dio dio;

  BinanceChartApi(this.dio);

  Future<List<dynamic>> getKlines({
    required String symbol,
    String interval = '1m',
  }) async {
    final response = await dio.get(
      '/api/v3/klines',
      queryParameters: {'symbol': symbol, 'interval': interval, 'limit': 50},
    );

    return response.data;
  }
}
