import 'package:crypto_icons/crypto_icons.dart';
import 'package:cryptopulse/core/helpers/market_ui_helper.dart';
import 'package:cryptopulse/core/utils/extensions/string_extensions.dart';
import 'package:cryptopulse/features/chart/presentation/screens/coin_detail_screen.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/mini_candle_chart.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/sparkline_chart.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketRow extends StatelessWidget {
  final Ticker ticker;
  final bool isFavorite;
  final List<double> history;

  const MarketRow({
    super.key,
    required this.ticker,
    required this.isFavorite,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    final price = ticker.price;
    final change = ticker.changePercent;

    String base = ticker.symbol.replaceAll('USDT', '');
    String pair = 'USDT';
    final isUp = change >= 0;
    final symbol = ticker.symbol
        .toUpperCase()
        .replaceAll('USDT', '')
        .replaceAll('BUSD', '')
        .trim()
        .toLowerCase();
    List<Candle> _convertHistoryToCandles(List<double> prices) {
      if (prices.length < 4) return [];

      final candles = <Candle>[];

      const groupSize = 4;

      for (int i = 0; i < prices.length; i += groupSize) {
        final slice = prices.skip(i).take(groupSize).toList();

        if (slice.isEmpty) continue;

        final open = slice.first;
        final close = slice.last;
        final high = slice.reduce((a, b) => a > b ? a : b);
        final low = slice.reduce((a, b) => a < b ? a : b);

        candles.add(
          Candle(
            open: open,
            close: close,
            high: high,
            low: low,
            volume: 0,
            time: DateTime.now(),
          ),
        );
      }

      return candles;
    }

    return InkWell(
      onTap: () {
        // TODO: Navigate to detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CoinDetailScreen(symbol: ticker.symbol),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  final bloc = context.read<WatchlistBloc>();

                  if (isFavorite) {
                    bloc.add(RemoveCoin(ticker.symbol));
                  } else {
                    bloc.add(AddCoin(ticker.symbol));
                  }
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    ticker.symbol.toCryptoIcon,
                    color: CryptoUiHelper.getCoinColor(
                      ticker.symbol,
                    ), // Apply the dynamic color
                    size: 28,
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(base, style: const TextStyle(color: Colors.white)),
                      Text(
                        ' / $pair',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Text(
                price.toStringAsFixed(2),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isUp ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isUp
                      ? '+${change.toStringAsFixed(2)} % '
                      : '${change.toStringAsFixed(2)} % ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: RepaintBoundary(
                child: MiniCandleChart(
                  candles: _convertHistoryToCandles(history),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
