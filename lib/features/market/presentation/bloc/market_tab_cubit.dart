import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum MarketTab { all, watchlist }

@injectable
class MarketTabCubit extends Cubit<MarketTab> {
  MarketTabCubit() : super(MarketTab.all);

  void showAll() => emit(MarketTab.all);

  void showWatchlist() => emit(MarketTab.watchlist);
}
