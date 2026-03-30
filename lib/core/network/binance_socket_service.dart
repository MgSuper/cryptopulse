import 'dart:convert';

import 'package:cryptopulse/core/network/exchange_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceSocketService implements ExchangeSocket {
  WebSocketChannel? _channel;
  @override
  Stream<Map<String, dynamic>> connect({required List<String> symbols}) {
    final streams = symbols.map((s) => '${s.toLowerCase()}@trade').join('/');
    final uri = Uri.parse(
      'wss://stream.binance.com:9443/stream?streams=$streams',
    );
    _channel = WebSocketChannel.connect(uri);
    return _channel!.stream.map((event) {
      final decoded = jsonDecode(event);
      return decoded['data'] as Map<String, dynamic>;
    });
  }

  @override
  void disconnect() {
    _channel?.sink.close();
  }
}
