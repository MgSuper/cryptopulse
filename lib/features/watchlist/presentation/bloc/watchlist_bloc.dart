import 'package:cryptopulse/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_event.dart';
import 'package:cryptopulse/features/watchlist/presentation/bloc/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchlistRepository repository;

  WatchlistBloc(this.repository) : super(WatchlistState.initial()) {
    on<LoadWatchlist>(_onLoad);
    on<AddCoin>(_onAdd);
    on<RemoveCoin>(_onRemove);
    on<Reorder>(_onReorder);
  }

  void _onLoad(LoadWatchlist event, Emitter<WatchlistState> emit) {
    final coins = repository.getWatchlist();

    emit(state.copyWith(coins: coins));
  }

  Future<void> _onAdd(AddCoin event, Emitter<WatchlistState> emit) async {
    await repository.addCoin(event.symbol);

    add(LoadWatchlist());
  }

  Future<void> _onRemove(RemoveCoin event, Emitter<WatchlistState> emit) async {
    await repository.removeCoin(event.symbol);

    add(LoadWatchlist());
  }

  Future<void> _onReorder(Reorder event, Emitter<WatchlistState> emit) async {
    await repository.reorder(event.oldIndex, event.newIndex);

    add(LoadWatchlist());
  }
}
