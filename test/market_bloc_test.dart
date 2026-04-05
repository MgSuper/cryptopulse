import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cryptopulse/features/market/domain/entities/ticker.dart';
import 'package:cryptopulse/features/market/domain/repositories/market_repository.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_bloc.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_event.dart';
import 'package:cryptopulse/features/market/presentation/bloc/market_state.dart';

class MockMarketRepository extends Mock implements MarketRepository {}

void main() {
  late MarketBloc bloc;
  late MockMarketRepository repository;

  setUp(() {
    repository = MockMarketRepository();
    bloc = MarketBloc(repository);
  });

  tearDown(() {
    bloc.close();
  });

  group('MarketBloc', () {
    blocTest<MarketBloc, MarketState>(
      'subscribes to market and emits ticker update',
      build: () {
        when(() => repository.subscribeTickers(any())).thenAnswer(
          (_) => Stream.value(
            Ticker(
              symbol: "BTCUSDT",
              price: 50000,
              changePercent: 1.5,
              timestamp: DateTime.now(),
            ),
          ),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const SubscribeMarket(["BTCUSDT"])),
      expect: () => [
        isA<MarketState>().having((s) => s.connected, 'connected', true),
        isA<MarketState>().having(
          (s) => s.tickers.containsKey("BTCUSDT"),
          'ticker exists',
          true,
        ),
      ],
    );

    blocTest<MarketBloc, MarketState>(
      'updates ticker state when TickerUpdated event is received',
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TickerUpdated(
          symbol: "BTCUSDT",
          price: 50000,
          changePercent: 2.0,
        ),
      ),
      expect: () => [isA<MarketState>()],
    );
  });
}
