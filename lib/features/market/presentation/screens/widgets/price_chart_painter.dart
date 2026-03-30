import 'package:flutter/material.dart';

class PriceChartPainter extends CustomPainter {
  final List<double> prices;

  PriceChartPainter(this.prices);

  @override
  void paint(Canvas canvas, Size size) {
    if (prices.length < 2) return;

    final minPrice = prices.reduce((a, b) => a < b ? a : b);
    final maxPrice = prices.reduce((a, b) => a > b ? a : b);

    final range = maxPrice - minPrice == 0 ? 1 : maxPrice - minPrice;

    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (int i = 0; i < prices.length; i++) {
      final x = i * size.width / (prices.length - 1);

      final normalized = (prices[i] - minPrice) / range;

      final y = size.height - (normalized * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PriceChartPainter oldDelegate) {
    return oldDelegate.prices != prices;
  }
}
