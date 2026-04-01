import 'package:cryptopulse/core/di/injection.dart';
import 'package:cryptopulse/features/market/presentation/screens/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/binance_socket_service.dart';
import 'features/market/data/repositories/market_repository_impl.dart';
import 'features/market/presentation/bloc/market_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // debugRepaintRainbowEnabled = true;
  // final socket = BinanceSocketService();
  // final repository = MarketRepositoryImpl(socket);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => getIt<MarketBloc>(),
        child: MarketScreen(),
      ),
    );
  }
}
