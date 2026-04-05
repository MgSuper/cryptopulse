import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:cryptopulse/features/market/domain/entities/candle.dart';

class ChartInfo extends StatelessWidget {
  final List<Candle> candles;

  const ChartInfo({super.key, required this.candles});

  @override
  Widget build(BuildContext context) {
    final lows = candles.map((e) => e.low).toList();

    final highs = candles.map((e) => e.high).toList();

    final minY = lows.reduce((a, b) => a < b ? a : b);

    final maxY = highs.reduce((a, b) => a > b ? a : b);

    if (candles.isEmpty) {
      return const Center(
        child: Text('No chart data', style: TextStyle(color: Colors.white)),
      );
    }

    // Use 'CandlestickSpot' based on your library's available types

    final List<CandlestickSpot> candleData = candles.asMap().entries.map((
      entry,
    ) {
      final c = entry.value;

      return CandlestickSpot(
        x: entry.key.toDouble(),

        open: c.open,

        high: c.high,

        low: c.low,

        close: c.close,
      );
    }).toList();

    return Column(
      children: [
        SizedBox(
          height: 340,

          child: RepaintBoundary(
            child: InteractiveViewer(
              panEnabled: true,

              scaleEnabled: true,

              child: CandlestickChart(
                CandlestickChartData(
                  minY: minY,

                  maxY: maxY,

                  // Use the exact property name from your list
                  candlestickSpots: candleData,

                  gridData: FlGridData(
                    show: true,

                    horizontalInterval: 50,

                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white.withValues(alpha: 0.05),

                        strokeWidth: 1,
                      );
                    },
                  ),

                  candlestickTouchData: CandlestickTouchData(
                    touchTooltipData: CandlestickTouchTooltipData(
                      // Match the signature: (Painter, Spot, Index)
                      getTooltipItems: (painter, spot, index) {
                        return CandlestickTooltipItem(
                          '''
          
          O: ${spot.open}
          
          H: ${spot.high}
          
          L: ${spot.low}
          
          C: ${spot.close}
          
          ''',

                          // const TextStyle(

                          // color: Colors.white,

                          // fontSize: 10,

                          // fontWeight: FontWeight.bold,

                          // ),
                        );
                      },

                      // Match your params: Color Function(CandlestickSpot)
                      getTooltipColor: (spot) => Colors.black87,

                      tooltipPadding: const EdgeInsets.all(4.0),

                      tooltipBorderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  borderData: FlBorderData(show: false),

                  titlesData: const FlTitlesData(show: false),

                  // Since 'candleStyle' is missing from your property list,

                  // this version uses the 'candlestickPainter' for styling.

                  // If you want default colors, you can omit this for now.
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        /// ==========================
        /// VOLUME CHART
        /// ==========================
        Expanded(
          child: SizedBox(
            height: 80,
            child: RepaintBoundary(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,

                  gridData: const FlGridData(show: false),

                  borderData: FlBorderData(show: false),

                  titlesData: const FlTitlesData(show: false),

                  barGroups: candles.asMap().entries.map((entry) {
                    final index = entry.key;
                    final candle = entry.value;

                    final isBull = candle.close >= candle.open;

                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: candle.volume,
                          width: 4,
                          color: isBull
                              ? Colors.greenAccent.withValues(alpha: 0.7)
                              : Colors.redAccent.withValues(alpha: 0.7),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
