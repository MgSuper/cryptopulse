import 'package:cryptopulse/features/market/presentation/screens/widgets/price_chart_painter.dart';
import 'package:flutter/material.dart';

class PriceChart extends StatelessWidget {
  final List<double> prices;

  const PriceChart({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: CustomPaint(
          size: const Size(double.infinity, 60),
          painter: PriceChartPainter(prices),
        ),
      ),
    );
  }
}
