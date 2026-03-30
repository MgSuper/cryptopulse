import 'package:get_it/get_it.dart';
import 'package:cryptopulse/core/network/exchange_socket.dart';
import 'package:cryptopulse/core/network/binance_socket_service.dart';
import 'package:cryptopulse/features/market/domain/repositories/market_repository.dart';
import 'package:cryptopulse/features/market/data/repositories/market_repository_impl.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_bloc.dart';

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  // 1. Features - BLoC
  // We use registerFactory so a new instance is created
  // every time we need it (good for UI cleanup)
  sl.registerFactory(() => MarketBloc(sl()));

  // 2. Repository
  // We use registerLazySingleton so the repository
  // stays in memory as a single instance
  sl.registerLazySingleton<MarketRepository>(() => MarketRepositoryImpl(sl()));

  // 3. External / Core
  sl.registerLazySingleton<ExchangeSocket>(() => BinanceSocketService());
}
