import 'dart:async';
import 'dart:io';

import 'package:backstage_app/app/shared/repositories/storage/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageHive implements ILocalStorage {
  // Open a Future
  final Completer<Box> _instance = Completer<Box>();

  LocalStorageHive() {
    _init();
  }

  _init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    var box = await Hive.openBox("db");
    _instance.complete(box);
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<String?> get(String? key) async {
    var box = await _instance.future;
    String? persisted = box.get(key);
    return persisted;
  }

  @override
  Future put(String key, String? value) async {
    var box = await _instance.future;
    box.put(key, value);
  }

  @override
  Box getBox(String key) {
    var box = Hive.box(key);
    return box;
  }

  @override
  Future close() async {
    var box = await _instance.future;
    return box.close();
  }
}
