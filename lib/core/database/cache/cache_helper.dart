

//hive: ^2.2.3
//hive_flutter: ^1.1.0
import 'package:hive/hive.dart';

class CacheHelper {
  static String myBox = "myBox";
 var box = Hive.box(CacheHelper.myBox);

//! this method to save data in Hive using a key

  Future<void> saveData({required String key, required dynamic value}) async {
    await box.put(key, value);
  }

//! this method to get data already saved in Hive using a key
  dynamic getData({required String key}) {
    return box.get(key);
  }

//! remove data using a specific key
  Future<void> removeData({required String key}) async {
    await box.delete(key);
  }

//! this method to check if Hive contains {key}
  bool containsKey({required String key}) {
    return box.containsKey(key);
  }

//! clear all data in Hive
  Future<void> clearData() async {
    await box.clear();
  }

//! this method to put data in Hive using a key
  Future<void> put({
    required String key,
    required dynamic value,
  }) async {
    await box.put(key, value);
  }
}
