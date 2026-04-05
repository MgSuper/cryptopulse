import 'package:cryptopulse/features/market/presentation/bloc/market_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketTabs extends StatelessWidget {
  const MarketTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketTabCubit, MarketTab>(
      builder: (context, tab) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _tab(
                context,
                'All',
                tab == MarketTab.all,
                () => context.read<MarketTabCubit>().showAll(),
              ),
              const SizedBox(width: 16),
              _tab(
                context,
                'Watchlist',
                tab == MarketTab.watchlist,
                () => context.read<MarketTabCubit>().showWatchlist(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _tab(
    BuildContext context,
    String title,
    bool selected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
