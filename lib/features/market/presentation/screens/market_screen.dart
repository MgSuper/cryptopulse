import 'package:cryptopulse/core/di/injection.dart';
import 'package:cryptopulse/core/utils/market_symbols.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_bloc.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_event.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_state.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_tab_cubit.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_header.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_list.dart';
import 'package:cryptopulse/features/market/presentation/screens/widgets/market_tabs.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<MarketTabCubit>()),
        BlocProvider(
          create: (_) => getIt<WatchlistBloc>()..add(LoadWatchlist()),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0F14),
        body: SafeArea(
          child: Column(
            children: [
              const MarketHeader(),
              const MarketTabs(),

              Expanded(
                child: BlocBuilder<MarketBloc, MarketState>(
                  builder: (context, marketState) {
                    return BlocBuilder<WatchlistBloc, WatchlistState>(
                      builder: (context, watchlistState) {
                        return BlocBuilder<MarketTabCubit, MarketTab>(
                          builder: (context, tab) {
                            final filteredSymbols = tab == MarketTab.all
                                ? marketState.tickers.keys.toList()
                                : marketState.tickers.keys
                                      .where(
                                        (s) => watchlistState.coins.contains(s),
                                      )
                                      .toList();

                            return MarketList(
                              symbols: filteredSymbols,
                              watchlist: watchlistState.coins,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
