import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cryptopulse/core/network/exchange_socket.dart';
import 'package:cryptopulse/features/chart/domain/repositories/chart_repository.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_bloc.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_event.dart';
import 'package:cryptopulse/features/chart/presentation/bloc/chart_state.dart';
import 'package:cryptopulse/features/market/domain/entities/candle.dart';

class MockChartRepository extends Mock implements ChartRepository {}

class MockExchangeSocket extends Mock implements ExchangeSocket {}

void main() {
  late ChartBloc bloc;
  late MockChartRepository repository;
  late MockExchangeSocket socket;

  setUp(() {
    repository = MockChartRepository();
    socket = MockExchangeSocket();

    bloc = ChartBloc(repository, socket);
  });

  tearDown(() {
    bloc.close();
  });

  group('ChartBloc', () {
    blocTest<ChartBloc, ChartState>(
      'loads candles successfully',
      build: () {
        when(
          () => repository.getCandles(
            symbol: any(named: 'symbol'),
            interval: any(named: 'interval'),
          ),
        ).thenAnswer(
          (_) async => [
            Candle(
              open: 1,
              high: 2,
              low: 0.5,
              close: 1.5,
              volume: 100,
              time: DateTime.now(),
            ),
          ],
        );

        when(
          () => socket.connectKline(
            symbol: any(named: 'symbol'),
            interval: any(named: 'interval'),
          ),
        ).thenAnswer((_) => const Stream.empty());

        return bloc;
      },
      act: (bloc) => bloc.add(const LoadChart('BTCUSDT')),
      expect: () => [isA<ChartState>(), isA<ChartState>()],
    );
  });
}
