import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_row.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_table_header.dart';
import 'package:flutter/material.dart';

class MarketList extends StatelessWidget {
  final List<Ticker> tickers;

  const MarketList({super.key, required this.tickers});

  @override
  Widget build(BuildContext context) {
    if (tickers.isEmpty) {
      return const Center(
        child: Text(
          "Waiting for market data...",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return Column(
      children: [
        const MarketTableHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: tickers.length,
            itemBuilder: (context, index) {
              return MarketRow(ticker: tickers[index]);
            },
          ),
        ),
      ],
    );
  }
}
