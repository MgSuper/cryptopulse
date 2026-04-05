import 'package:cryptopulse/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WatchlistRepository)
class WatchlistRepositoryImpl implements WatchlistRepository {
  final Box<String> box;

  WatchlistRepositoryImpl(this.box);

  @override
  List<String> getWatchlist() {
    return box.values.toList();
  }

  @override
  Future<void> addCoin(String symbol) async {
    if (!box.values.contains(symbol)) {
      await box.add(symbol);
    }
  }

  @override
  Future<void> removeCoin(String symbol) async {
    final key = box.keys.firstWhere(
      (k) => box.get(k) == symbol,
      orElse: () => null,
    );

    if (key != null) {
      await box.delete(key);
    }
  }

  @override
  Future<void> reorder(int oldIndex, int newIndex) async {
    final list = box.values.toList();

    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    await box.clear();

    for (final coin in list) {
      await box.add(coin);
    }
  }
}
