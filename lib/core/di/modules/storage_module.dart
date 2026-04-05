import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @lazySingleton
  Box<String> watchlistBox() => Hive.box<String>('watchlist');
}
