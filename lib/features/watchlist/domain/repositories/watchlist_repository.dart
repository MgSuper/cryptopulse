abstract class WatchlistRepository {
  List<String> getWatchlist();

  Future<void> addCoin(String symbol);

  Future<void> removeCoin(String symbol);

  Future<void> reorder(int oldIndex, int newIndex);
}
