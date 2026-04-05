import 'package:flutter/material.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';

class ChartStats extends StatelessWidget {
  final Candle candle;

  const ChartStats({super.key, required this.candle});

  Widget _item(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item("Open", candle.open.toStringAsFixed(2)),
        _item("High", candle.high.toStringAsFixed(2)),
        _item("Low", candle.low.toStringAsFixed(2)),
        _item("Close", candle.close.toStringAsFixed(2)),
        _item("Volume", candle.volume.toStringAsFixed(2)),
      ],
    );
  }
}
