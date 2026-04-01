import 'package:cryptopulse/core/utils/market_symbols.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_bloc.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_event.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_state.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_header.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_list.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MarketBloc>().add(SubscribeMarket(defaultSymbols));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F14),
      body: SafeArea(
        child: Column(
          children: [
            const MarketHeader(),
            const MarketTabs(),
            Expanded(
              child: BlocBuilder<MarketBloc, MarketState>(
                builder: (context, state) {
                  return MarketList(tickers: state.tickers.values.toList());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
