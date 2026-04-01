import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartInfo extends StatelessWidget {
  final List<Candle> candles;

  const ChartInfo({super.key, required this.candles});

  @override
  Widget build(BuildContext context) {
    final closes = candles.map((e) => e.close).toList();

    final minPrice = closes.reduce((a, b) => a < b ? a : b);
    final maxPrice = closes.reduce((a, b) => a > b ? a : b);

    final spots = candles.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.close);
    }).toList();

    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          minY: minPrice,
          maxY: maxPrice,
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
