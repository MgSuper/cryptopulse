import 'dart:isolate';

import 'package:cryptopulse/core/network/exchange_socket.dart';
import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/domain/repositories/market_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MarketRepository)
class MarketRepositoryImpl implements MarketRepository {
  final ExchangeSocket socket;

  MarketRepositoryImpl(this.socket);

  @override
  Stream<Ticker> subscribeTickers(List<String> symbols) async* {
    final receivePort = ReceivePort();
    final portStream = receivePort.asBroadcastStream();

    await Isolate.spawn(_tickerIsolateEntry, receivePort.sendPort);

    // handshake
    final isolateSendPort = await portStream.first as SendPort;

    // start websocket
    final socketStream = socket.connect(symbols: symbols);

    socketStream.listen((data) {
      isolateSendPort.send(data);
    });

    // listen for processed tickers
    await for (final message in portStream) {
      if (message is Ticker) {
        yield message;
      }
    }
  }

  static void _tickerIsolateEntry(SendPort mainSendPort) {
    final port = ReceivePort();

    mainSendPort.send(port.sendPort);

    port.listen((message) {
      final data = message as Map<String, dynamic>;

      final ticker = Ticker(
        symbol: data['s'],
        price: double.parse(data['c']),
        changePercent: double.parse(data['P']),
        timestamp: DateTime.now(),
      );

      mainSendPort.send(ticker);
    });
  }

  @override
  void disconnect() {
    socket.disconnect();
  }
}
