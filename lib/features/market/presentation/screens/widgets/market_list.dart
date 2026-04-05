import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_row.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_table_header.dart';
import 'package:flutter/material.dart';

class MarketList extends StatelessWidget {
  final List<String> symbols;
  // final List<Ticker> tickers;
  final List<String> watchlist;
  // final Map<String, List<double>> priceHistory;

  const MarketList({
    super.key,
    required this.symbols,
    // required this.tickers,
    required this.watchlist,
    // required this.priceHistory,
  });

  @override
  Widget build(BuildContext context) {
    // if (tickers.isEmpty) {
    //   return const Center(
    //     child: Text(
    //       "Waiting for market data...",
    //       style: TextStyle(color: Colors.white70),
    //     ),
    //   );
    // }

    return Column(
      children: [
        const MarketTableHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: symbols.length,
            itemBuilder: (context, index) {
              final symbol = symbols[index];

              return MarketRow(
                symbol: symbol,
                isFavorite: watchlist.contains(symbol),
              );
            },
          ),
        ),
      ],
    );
  }
}
