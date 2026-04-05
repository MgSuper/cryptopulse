import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cryptopulse/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_state.dart';

class MockWatchlistRepository extends Mock implements WatchlistRepository {}

void main() {
  late WatchlistBloc bloc;
  late MockWatchlistRepository repository;

  setUp(() {
    repository = MockWatchlistRepository();
    bloc = WatchlistBloc(repository);
  });

  tearDown(() {
    bloc.close();
  });

  group('WatchlistBloc', () {
    blocTest<WatchlistBloc, WatchlistState>(
      'emits watchlist when LoadWatchlist is added',
      build: () {
        when(
          () => repository.getWatchlist(),
        ).thenReturn(['BTCUSDT', 'ETHUSDT']);

        return bloc;
      },
      act: (bloc) => bloc.add(LoadWatchlist()),
      expect: () => [
        const WatchlistState(coins: ['BTCUSDT', 'ETHUSDT']),
      ],
    );

    blocTest<WatchlistBloc, WatchlistState>(
      'adds coin to watchlist',
      build: () {
        when(() => repository.addCoin('BTCUSDT')).thenAnswer((_) async {});

        when(() => repository.getWatchlist()).thenReturn(['BTCUSDT']);

        return bloc;
      },
      act: (bloc) => bloc.add(const AddCoin('BTCUSDT')),
      expect: () => [
        const WatchlistState(coins: ['BTCUSDT']),
      ],
    );

    blocTest<WatchlistBloc, WatchlistState>(
      'removes coin from watchlist',
      build: () {
        when(() => repository.removeCoin('BTCUSDT')).thenAnswer((_) async {});

        when(() => repository.getWatchlist()).thenReturn([]);

        return bloc;
      },
      act: (bloc) => bloc.add(const RemoveCoin('BTCUSDT')),
      expect: () => [const WatchlistState(coins: [])],
    );

    blocTest<WatchlistBloc, WatchlistState>(
      'reorders watchlist',
      build: () {
        when(() => repository.reorder(0, 1)).thenAnswer((_) async {});

        when(
          () => repository.getWatchlist(),
        ).thenReturn(['ETHUSDT', 'BTCUSDT']);

        return bloc;
      },
      act: (bloc) => bloc.add(const Reorder(0, 1)),
      expect: () => [
        const WatchlistState(coins: ['ETHUSDT', 'BTCUSDT']),
      ],
    );
  });
}
