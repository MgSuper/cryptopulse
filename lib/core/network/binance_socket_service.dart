// import 'dart:convert';

// import 'package:cryptopulse/core/network/exchange_socket.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class BinanceSocketService implements ExchangeSocket {
//   WebSocketChannel? _channel;
//   @override
//   Stream<Map<String, dynamic>> connect({required List<String> symbols}) {
//     final streams = symbols.map((s) => '${s.toLowerCase()}@trade').join('/');
//     final uri = Uri.parse(
//       'wss://stream.binance.com:9443/stream?streams=$streams',
//     );
//     _channel = WebSocketChannel.connect(uri);
//     return _channel!.stream.map((event) {
//       final decoded = jsonDecode(event);
//       return decoded['data'] as Map<String, dynamic>;
//     });
//   }

//   @override
//   void disconnect() {
//     _channel?.sink.close();
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:cryptopulse/core/network/exchange_socket.dart';

class BinanceSocketService implements ExchangeSocket {
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>>? _streamController;

  static const String _baseUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  // Implementation of the new getter from the interface
  @override
  bool get isConnected =>
      _channel != null &&
      _streamController != null &&
      !_streamController!.isClosed;

  @override
  Stream<Map<String, dynamic>> connect({required List<String> symbols}) {
    // Clean up before starting a new one
    _cleanup();

    _streamController = StreamController<Map<String, dynamic>>.broadcast();
    _establishConnection(symbols);

    return _streamController!.stream;
  }

  void _establishConnection(List<String> symbols) async {
    if (symbols.isEmpty) return;

    final endpoint = symbols.map((s) => '${s.toLowerCase()}@ticker').join('/');
    final uri = Uri.parse(
      'wss://stream.binance.com:9443/stream?streams=$endpoint',
    );

    try {
      // 1. Expert Detail: Create the channel
      _channel = WebSocketChannel.connect(uri);

      // 2. IMPORTANT FOR WEB: Wait for the handshake to finish
      await _channel!.ready;
      debugPrint('Binance Socket Connected Successfully');

      // 3. Expert Detail: Direct Listen
      _channel!.stream.listen(
        (event) {
          // On Web, we MUST handle the data immediately
          try {
            final decoded = jsonDecode(event.toString());
            final data = decoded['data'] as Map<String, dynamic>;

            if (_streamController != null && !_streamController!.isClosed) {
              _streamController!.add(data);
            }
          } catch (e) {
            debugPrint('Data Parsing Error: $e');
          }
        },
        onError: (error) {
          debugPrint('Binance Socket Error: $error');
          _reconnect(symbols);
        },
        onDone: () {
          // If this hits immediately after 'Connected',
          // check your browser's console for 'CORS' or 'Blocked' messages.
          debugPrint('Server closed the stream (onDone)');
          _reconnect(symbols);
        },
        cancelOnError: true,
      );
    } catch (e) {
      debugPrint('Handshake Failed: $e');
      _reconnect(symbols);
    }
  }

  void _reconnect(List<String> symbols) {
    // Prevent multiple parallel reconnection attempts
    Future.delayed(const Duration(seconds: 5), () {
      if (_streamController != null && !_streamController!.isClosed) {
        _establishConnection(symbols);
      }
    });
  }

  static Map<String, dynamic> _parseJson(String source) {
    return jsonDecode(source) as Map<String, dynamic>;
  }

  // Internal helper to dry up the code
  void _cleanup() {
    _channel?.sink.close();
    _channel = null;
  }

  @override
  Future<void> disconnect() async {
    _cleanup();
    await _streamController?.close();
    _streamController = null;
    debugPrint('Binance Socket Service Disconnected Cleanly');
  }
}
