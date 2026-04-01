import 'package:crypto_icons/crypto_icons.dart';
import 'package:cryptopulse/core/helpers/market_ui_helper.dart';
import 'package:cryptopulse/core/utils/extensions/string_extensions.dart';
import 'package:cryptopulse/features/chart/presentation/screens/coin_detail_screen.dart';
import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/sparkline_chart.dart';
import 'package:flutter/material.dart';

class MarketRow extends StatelessWidget {
  final Ticker ticker;

  const MarketRow({super.key, required this.ticker});

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
    print('Symbol: $symbol');

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
              flex: 3,
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
            Expanded(
              flex: 2,
              child: RepaintBoundary(
                child: SparklineChart(
                  data: [
                    ticker.price * 0.98,
                    ticker.price * 0.99,
                    ticker.price * 1.01,
                    ticker.price * 1.02,
                    ticker.price,
                  ],
                  color: ticker.changePercent >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
