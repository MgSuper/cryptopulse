import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/price_chart.dart';
import 'package:flutter/material.dart';

class TickerCard extends StatefulWidget {
  final Ticker ticker;

  const TickerCard({super.key, required this.ticker});

  @override
  State<TickerCard> createState() => _TickerCardState();
}

class _TickerCardState extends State<TickerCard> {
  double? previousPrice;
  final List<double> priceHistory = [];

  @override
  void didUpdateWidget(covariant TickerCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    priceHistory.add(widget.ticker.price);

    if (priceHistory.length > 30) {
      priceHistory.removeAt(0);
    }

    if (oldWidget.ticker.price != widget.ticker.price) {
      previousPrice = oldWidget.ticker.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    final price = widget.ticker.price;

    final bool isUp = previousPrice != null && price > previousPrice!;

    final bool isDown = previousPrice != null && price < previousPrice!;

    Color priceColor = Colors.white;

    if (isUp) priceColor = Colors.greenAccent;
    if (isDown) priceColor = Colors.redAccent;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.ticker.symbol,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          /// Animated price transition
          TweenAnimationBuilder<double>(
            tween: Tween(begin: previousPrice ?? price, end: price),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              return Text(
                "\$${value.toStringAsFixed(2)}",
                style: TextStyle(
                  color: priceColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),

          const SizedBox(height: 8),

          /// Direction indicator
          if (isUp)
            const Icon(Icons.arrow_upward, color: Colors.greenAccent, size: 16),
          if (isDown)
            const Icon(Icons.arrow_downward, color: Colors.redAccent, size: 16),

          const SizedBox(height: 12),

          Expanded(child: PriceChart(prices: priceHistory)),
        ],
      ),
    );
  }
}
