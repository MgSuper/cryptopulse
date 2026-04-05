import 'package:cryptopulse/core/helpers/market_ui_helper.dart';
import 'package:cryptopulse/core/utils/extensions/string_extensions.dart';
import 'package:cryptopulse/features/chart/presentation/screens/coin_detail_screen.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';
import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_bloc.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_state.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/mini_candle_chart.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketRow extends StatelessWidget {
  final String symbol;
  final bool isFavorite;

  const MarketRow({super.key, required this.symbol, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MarketBloc, MarketState, Ticker?>(
      selector: (state) => state.tickers[symbol],
      builder: (context, ticker) {
        if (ticker == null) return const SizedBox();

        final price = ticker.price;
        final change = ticker.changePercent;

        final base = ticker.symbol.replaceAll('USDT', '');
        final pair = 'USDT';

        final isUp = change >= 0;

        final history = context.select<MarketBloc, List<double>>(
          (bloc) => bloc.state.priceHistory[symbol] ?? [],
        );

        final candles = _convertHistoryToCandles(history);

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CoinDetailScreen(symbol: ticker.symbol),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            child: Row(
              children: [
                /// ICON
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      IconButton(
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
                      Icon(
                        ticker.symbol.toCryptoIcon,
                        color: CryptoUiHelper.getCoinColor(ticker.symbol),
                        size: 28,
                      ),
                    ],
                  ),
                ),

                /// NAME
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Text(base, style: const TextStyle(color: Colors.white)),
                      Text(
                        ' / $pair',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),

                /// PRICE
                Expanded(
                  flex: 3,
                  child: Text(
                    price.toStringAsFixed(2),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                /// 24H %
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isUp ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      isUp
                          ? '+${change.toStringAsFixed(2)} %'
                          : '${change.toStringAsFixed(2)} %',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                /// MINI CHART
                Expanded(
                  flex: 2,
                  child: RepaintBoundary(
                    child: SizedBox(
                      width: 80,
                      child: MiniCandleChart(candles: candles),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Candle> _convertHistoryToCandles(List<double> prices) {
    if (prices.length < 3) return [];

    final candles = <Candle>[];

    const groupSize = 3;

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
}
