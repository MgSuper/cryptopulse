import 'package:equatable/equatable.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}

class AddCoin extends WatchlistEvent {
  final String symbol;

  const AddCoin(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

class RemoveCoin extends WatchlistEvent {
  final String symbol;

  const RemoveCoin(this.symbol);

  @override
  List<Object?> get props => [symbol];
}

class Reorder extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  const Reorder(this.oldIndex, this.newIndex);

  @override
  List<Object?> get props => [oldIndex, newIndex];
}
