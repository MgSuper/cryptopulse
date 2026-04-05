import 'package:flutter/material.dart';

class CryptoFont {
  static const String family = 'CryptoFont';

  // These hex codes come from the CSS file in the repo you linked
  static const IconData btc = IconData(0xE045, fontFamily: family);
  static const IconData eth = IconData(0xE09E, fontFamily: family);
  static const IconData bnb = IconData(0xE03B, fontFamily: family);
  static const IconData sol = IconData(0xE174, fontFamily: family);
  static const IconData ada = IconData(0xE008, fontFamily: family);
  static const IconData doge = IconData(0xE081, fontFamily: family);
  static const IconData ltc = IconData(0xE0F2, fontFamily: family);
  static const IconData xrp = IconData(0xE1CA, fontFamily: family);
  static const IconData matic = IconData(0xE0F6, fontFamily: family);
  static const IconData link = IconData(0xE0EC, fontFamily: family);

  // 'dogeusdt', 'ltcusdt', 'xrpusdt', 'maticusdt', 'linkusdt', 'avaxusdt'
}

extension SymbolToIcon on String {
  IconData get toCryptoIcon {
    final clean = toLowerCase().replaceAll('usdt', '').trim();
    switch (clean) {
      case 'btc':
        return CryptoFont.btc;
      case 'eth':
        return CryptoFont.eth;
      case 'bnb':
        return CryptoFont.bnb;
      case 'sol':
        return CryptoFont.sol;
      case 'ada':
        return CryptoFont.ada;
      case 'doge':
        return CryptoFont.doge;
      case 'ltc':
        return CryptoFont.ltc;
      case 'xrp':
        return CryptoFont.xrp;
      case 'matic':
        return CryptoFont.matic;
      case 'link':
        return CryptoFont.link;
      default:
        return Icons.monetization_on;
    }
  }
}
