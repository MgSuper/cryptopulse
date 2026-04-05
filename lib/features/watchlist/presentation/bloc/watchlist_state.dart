import 'package:equatable/equatable.dart';

class WatchlistState extends Equatable {
  final List<String> coins;

  const WatchlistState({required this.coins});

  factory WatchlistState.initial() {
    return const WatchlistState(coins: []);
  }

  WatchlistState copyWith({List<String>? coins}) {
    return WatchlistState(coins: coins ?? this.coins);
  }

  @override
  List<Object?> get props => [coins];
}
