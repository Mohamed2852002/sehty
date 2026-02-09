import 'package:hive_flutter/hive_flutter.dart';
import 'package:sehty/core/utils/app_constants.dart';
import 'package:sehty/features/auth/data/models/user_model.dart';
import 'package:sehty/features/auth/data/models/user_model_adapter.dart';
import 'package:sehty/features/auth/domain/entities/user_entity.dart';

class HiveHelper {
  // Singleton pattern
  HiveHelper._privateConstructor();
  static final HiveHelper instance = HiveHelper._privateConstructor();

  /// Initialize Hive (call this once in main)
  static Future<void> init() async {
    await Hive.initFlutter();
    // Register adapters
    Hive.registerAdapter(UserModelAdapter());
    // Open the users box
    await Hive.openBox<UserModel>(AppConstants.usersBox);
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

  // ============ User Caching Methods ============

  /// Save user to Hive
  Future<void> saveUser(UserModel user) async {
    final box = Hive.box<UserModel>(AppConstants.usersBox);
    await box.put(AppConstants.userKey, user);
  }

  /// Get cached user from Hive (returns UserEntity to respect clean architecture)
  UserEntity? getUser() {
    final box = Hive.box<UserModel>(AppConstants.usersBox);
    return box.get(AppConstants.userKey);
  }

  /// Delete cached user from Hive
  Future<void> deleteUser() async {
    final box = Hive.box<UserModel>(AppConstants.usersBox);
    await box.delete(AppConstants.userKey);
  }

  /// Check if user is cached
  bool hasUser() {
    final box = Hive.box<UserModel>(AppConstants.usersBox);
    return box.containsKey(AppConstants.userKey);
  }
}
