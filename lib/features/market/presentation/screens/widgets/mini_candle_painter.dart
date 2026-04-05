import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:flutter/material.dart';

class MiniCandlePainter extends CustomPainter {
  final List<Candle> candles;

  MiniCandlePainter(this.candles);

  @override
  void paint(Canvas canvas, Size size) {
    if (candles.isEmpty) return;

    final highs = candles.map((e) => e.high);
    final lows = candles.map((e) => e.low);

    final max = highs.reduce((a, b) => a > b ? a : b);
    final min = lows.reduce((a, b) => a < b ? a : b);

    final range = max - min == 0 ? 1 : max - min;

    final candleWidth = size.width / candles.length;

    for (int i = 0; i < candles.length; i++) {
      final c = candles[i];

      final openY = size.height - ((c.open - min) / range * size.height);
      final closeY = size.height - ((c.close - min) / range * size.height);
      final highY = size.height - ((c.high - min) / range * size.height);
      final lowY = size.height - ((c.low - min) / range * size.height);

      final x = i * candleWidth + candleWidth / 2;

      final isBull = c.close >= c.open;

      final paint = Paint()
        ..color = isBull ? Colors.greenAccent : Colors.redAccent
        ..strokeWidth = 1;

      // wick
      canvas.drawLine(Offset(x, highY), Offset(x, lowY), paint);

      // body
      final rect = Rect.fromLTRB(
        x - candleWidth * 0.2,
        openY,
        x + candleWidth * 0.2,
        closeY,
      );

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
