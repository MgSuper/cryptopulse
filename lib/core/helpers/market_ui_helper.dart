import 'package:flutter/material.dart';

class CryptoUiHelper {
  static const Map<String, Color> _coinColors = {
    'BTC': Color(0xFFF7931A), // Official Bitcoin Orange
    'ETH': Color(0xFF627EEA), // Ethereum Blue
    'BNB': Color(0xFFF3BA2F), // Binance Yellow
    'SOL': Color(0xFF14F195), // Solana Green/Cyan
    'ADA': Color(0xFF0033AD), // Cardano Blue
    'XRP': Color(0xFF23292F), // XRP Slate
    'DOT': Color(0xFFE6007A), // Polkadot Pink
    'DOGE': Color(0xFFC2A633), // Dogecoin Gold
    'USDT': Color(0xFF26A17B), // Tether Green
  };

  static Color getCoinColor(String symbol) {
    // Clean "BTCUSDT" -> "BTC"
    final base = symbol.toUpperCase().replaceAll('USDT', '').trim();
    return _coinColors[base] ?? Colors.grey.shade400; // Fallback for new coins
  }
}
