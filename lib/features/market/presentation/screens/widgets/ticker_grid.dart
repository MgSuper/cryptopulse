import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/ticker_card.dart';
import 'package:flutter/material.dart';

class TickerGrid extends StatelessWidget {
  final Map<String, Ticker> tickers;

  const TickerGrid({super.key, required this.tickers});

  @override
  Widget build(BuildContext context) {
    if (tickers.isEmpty) {
      return const Center(
        child: Text(
          'Waiting for market data...',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }
    final items = tickers.values.toList();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 320,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        return TickerCard(ticker: items[index]);
      },
    );
  }
}
