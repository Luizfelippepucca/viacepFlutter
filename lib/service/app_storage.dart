import 'package:dio/utils/storage_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  late SharedPreferences? _storage;

  _setStorage(String key, dynamic value) async {
    _storage = await SharedPreferences.getInstance();
    _storage?.setBool(key, value);
  }

  setTheme(bool theme) async {
    await _setStorage(StorageKey.themeKey, theme);
  }

  setNotification(bool notification) async {
    await _setStorage(StorageKey.keyNotification, notification);
  }

  removeKey(String key) async {
    _storage = await SharedPreferences.getInstance();
    _storage?.remove(key);
  }

  Future<bool> getStorage(String key) async {
    _storage = await SharedPreferences.getInstance();
    return _storage?.getBool(key) ?? false;
  }
}
