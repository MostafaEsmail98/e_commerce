//hive: ^2.2.3
//hive_flutter: ^1.1.0
import 'package:hive/hive.dart';

class CacheHelper {
  static String myBox = "myBox";

//! this method to save data in Hive using a key

  static void saveData({required String key, required dynamic value}) async {
    await Hive.box(myBox).put(key, value);
  }

//! this method to get data already saved in Hive using a key
 static dynamic getData({required String key}) {
    return Hive.box(myBox).get(key);
  }

  static void removeData({required String key}) async {
    await Hive.box(myBox).delete(key);
  }

 static bool containsKey({required String key}) {
    return Hive.box(myBox).containsKey(key);
  }

  static void clearData() async {
    await Hive.box(myBox).clear();
  }

  static void put({required String key, required dynamic value}) async {
    await Hive.box(myBox).put(key, value);
  }
}
