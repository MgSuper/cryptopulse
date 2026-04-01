import 'dart:isolate';

class TickerProcessor {
  static Future<void> processTicker(
    SendPort sendPort,
    Map<String, dynamic> data,
  ) async {
    final symbol = data['s'];
    final price = double.parse(data['p']);

    sendPort.send({
      'symbol': symbol,
      'price': price,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
