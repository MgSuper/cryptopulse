import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:cryptopulse/core/network/exchange_socket.dart';

@Injectable(as: ExchangeSocket)
class BinanceSocketService implements ExchangeSocket {
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>>? _streamController;

  static const String _baseUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  @override
  bool get isConnected =>
      _channel != null &&
      _streamController != null &&
      !_streamController!.isClosed;

  /// ===============================
  /// TICKER STREAM (Dashboard)
  /// ===============================
  @override
  Stream<Map<String, dynamic>> connect({required List<String> symbols}) {
    _cleanup();

    _streamController = StreamController<Map<String, dynamic>>.broadcast();

    final streams = symbols.map((s) => '${s.toLowerCase()}@ticker').join('/');
    final uri = Uri.parse('$_baseUrl$streams');

    _establishConnection(uri);

    return _streamController!.stream;
  }

  /// ===============================
  /// KLINE STREAM (Chart)
  /// ===============================
  @override
  Stream<Map<String, dynamic>> connectKline({
    required String symbol,
    String interval = "1m",
  }) {
    _cleanup();

    _streamController = StreamController<Map<String, dynamic>>.broadcast();

    final stream = '${symbol.toLowerCase()}@kline_$interval';
    final uri = Uri.parse('$_baseUrl$stream');

    _establishConnection(uri);

    return _streamController!.stream;
  }

  /// ===============================
  /// CONNECTION HANDLER
  /// ===============================
  void _establishConnection(Uri uri) async {
    try {
      _channel = WebSocketChannel.connect(uri);

      await _channel!.ready;
      debugPrint('Binance Socket Connected');

      _channel!.stream.listen(
        (event) {
          try {
            final decoded = jsonDecode(event.toString());

            final data = decoded['data'] as Map<String, dynamic>;

            if (_streamController != null && !_streamController!.isClosed) {
              _streamController!.add(data);
            }
          } catch (e) {
            debugPrint('Socket Parsing Error: $e');
          }
        },
        onError: (error) {
          debugPrint('Socket Error: $error');
          _reconnect(uri);
        },
        onDone: () {
          debugPrint('Socket closed by server');
          _reconnect(uri);
        },
        cancelOnError: true,
      );
    } catch (e) {
      debugPrint('Socket handshake failed: $e');
      _reconnect(uri);
    }
  }

  /// ===============================
  /// AUTO RECONNECT
  /// ===============================
  void _reconnect(Uri uri) {
    Future.delayed(const Duration(seconds: 5), () {
      if (_streamController != null && !_streamController!.isClosed) {
        _establishConnection(uri);
      }
    });
  }

  /// ===============================
  /// CLEANUP
  /// ===============================
  void _cleanup() {
    _channel?.sink.close();
    _channel = null;
  }

  @override
  Future<void> disconnect() async {
    _cleanup();
    await _streamController?.close();
    _streamController = null;
    debugPrint('Binance Socket Disconnected');
  }
}
