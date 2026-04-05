import 'package:cryptopulse/core/di/injection.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_bloc.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_event.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_state.dart';
import 'package:cryptopulse/features/chart/presentation/screens/widgets/chart_info.dart';
import 'package:cryptopulse/features/chart/presentation/screens/widgets/chart_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinDetailScreen extends StatelessWidget {
  final String symbol;

  const CoinDetailScreen({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChartBloc>()..add(LoadChart(symbol)),
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0F14),
        appBar: AppBar(
          title: Text(symbol, style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<ChartBloc, ChartState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ChartInfo(candles: state.candles),
                  ),
                ),
                const SizedBox(height: 20),

                /// STATS PANEL
                ChartStats(candle: state.candles.last),

                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
