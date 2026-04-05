import 'package:cryptopulse/features/market/presentation/screens/widgets/market_row.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_table_header.dart';
import 'package:flutter/material.dart';

class MarketList extends StatelessWidget {
  final List<String> symbols;
  final List<String> watchlist;

  const MarketList({super.key, required this.symbols, required this.watchlist});

  @override
  Widget build(BuildContext context) {
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
