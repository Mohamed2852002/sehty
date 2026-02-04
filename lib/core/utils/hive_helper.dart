import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  // Singleton pattern
  HiveHelper._privateConstructor();
  static final HiveHelper instance = HiveHelper._privateConstructor();

  /// Initialize Hive (call this once in main)
  static Future<void> init() async {
    await Hive.initFlutter();
    // Optional: register adapters here
    // Hive.registerAdapter(MyModelAdapter());
  }

  /// Open a box
  Future<Box> openBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }

  /// Put data
  Future<void> put(String boxName, String key, dynamic value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  /// Get data
  Future<T?> get<T>(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.get(key) as T?;
  }

  /// Delete a key
  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Clear the box
  Future<void> clearBox(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  /// Check if key exists
  Future<bool> containsKey(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }
}