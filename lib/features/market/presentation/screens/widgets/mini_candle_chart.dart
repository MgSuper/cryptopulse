import 'package:cryptopulse/features/market/presentation/screens/widgets/mini_candle_painter.dart';
import 'package:flutter/material.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';

class MiniCandleChart extends StatelessWidget {
  final List<Candle> candles;
  final double width;
  final double height;

  const MiniCandleChart({
    super.key,
    required this.candles,
    this.width = 80,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    if (candles.length < 3) {
      return const SizedBox();
    }
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(painter: MiniCandlePainter(candles)),
    );
  }
}
