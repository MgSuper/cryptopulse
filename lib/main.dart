import 'package:cryptopulse/features/market/presentation/screens/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/binance_socket_service.dart';
import 'features/market/data/repositories/market_repository_impl.dart';
import 'features/market/presentation/bloc/market_bloc.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  final socket = BinanceSocketService();
  final repository = MarketRepositoryImpl(socket);

  runApp(MyApp(repository));
}

class MyApp extends StatelessWidget {
  final MarketRepositoryImpl repository;

  const MyApp(this.repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => MarketBloc(repository),
        child: MarketScreen(),
      ),
    );
  }
}
