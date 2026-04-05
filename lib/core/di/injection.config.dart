// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cryptopulse/core/di/modules/network_module.dart' as _i208;
import 'package:cryptopulse/core/di/modules/storage_module.dart' as _i32;
import 'package:cryptopulse/core/network/binance_socket_service.dart' as _i752;
import 'package:cryptopulse/core/network/exchange_socket.dart' as _i720;
import 'package:cryptopulse/features/chart/data/datasources/binance_chart_api.dart'
    as _i228;
import 'package:cryptopulse/features/chart/data/repositories/chart_repository_impl.dart'
    as _i345;
import 'package:cryptopulse/features/chart/domain/repositories/chart_repository.dart'
    as _i525;
import 'package:cryptopulse/features/chart/presentation/bloc/chart_bloc.dart'
    as _i609;
import 'package:cryptopulse/features/market/data/repositories/market_repository_impl.dart'
    as _i966;
import 'package:cryptopulse/features/market/domain/repositories/market_repository.dart'
    as _i245;
import 'package:cryptopulse/features/market/presentation/bloc/market_bloc.dart'
    as _i628;
import 'package:cryptopulse/features/market/presentation/bloc/market_tab_cubit.dart'
    as _i543;
import 'package:cryptopulse/features/watchlist/data/watchlist_repository_impl.dart'
    as _i430;
import 'package:cryptopulse/features/watchlist/domain/repositories/watchlist_repository.dart'
    as _i180;
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_bloc.dart'
    as _i40;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    gh.factory<_i543.MarketTabCubit>(() => _i543.MarketTabCubit());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i979.Box<String>>(() => storageModule.watchlistBox());
    gh.lazySingleton<_i228.BinanceChartApi>(
      () => _i228.BinanceChartApi(gh<_i361.Dio>()),
    );
    gh.factory<_i720.ExchangeSocket>(() => _i752.BinanceSocketService());
    gh.lazySingleton<_i525.ChartRepository>(
      () => _i345.ChartRepositoryImpl(gh<_i228.BinanceChartApi>()),
    );
    gh.lazySingleton<_i245.MarketRepository>(
      () => _i966.MarketRepositoryImpl(gh<_i720.ExchangeSocket>()),
    );
    gh.factory<_i628.MarketBloc>(
      () => _i628.MarketBloc(gh<_i245.MarketRepository>()),
    );
    gh.lazySingleton<_i180.WatchlistRepository>(
      () => _i430.WatchlistRepositoryImpl(gh<_i979.Box<String>>()),
    );
    gh.factory<_i40.WatchlistBloc>(
      () => _i40.WatchlistBloc(gh<_i180.WatchlistRepository>()),
    );
    gh.factory<_i609.ChartBloc>(
      () => _i609.ChartBloc(
        gh<_i525.ChartRepository>(),
        gh<_i720.ExchangeSocket>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i208.NetworkModule {}

class _$StorageModule extends _i32.StorageModule {}
