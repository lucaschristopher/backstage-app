import 'package:hive/hive.dart';

abstract class ILocalStorage {
  Future<String?> get(String? key);
  Future put(String key, String? value);
  Future delete(String key);
  Future close();
  Box getBox(String key);
}
