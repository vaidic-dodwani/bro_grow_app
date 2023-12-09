import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorageService {
  // A method to configure Android-specific options for FlutterSecureStorage.
  static const _androidOptions =
      AndroidOptions(encryptedSharedPreferences: true);

// Creating an instance of FlutterSecureStorage with Android-specific options.
  static const _storage = FlutterSecureStorage(aOptions: _androidOptions);

// Asynchronous method to securely set a string value using FlutterSecureStorage.
  Future<void> setSecuredString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

// Asynchronous method to securely retrieve a string value using FlutterSecureStorage.
  Future<String?> getSecuredString(String key) async {
    return await _storage.read(key: key);
  }

// Asynchronous method to securely set a boolean value using FlutterSecureStorage.
  Future<void> setSecuredBool(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
  }

// Asynchronous method to securely retrieve a boolean value using FlutterSecureStorage.
  Future<bool?> getSecuredBool(String key) async {
    final value = await _storage.read(key: key);
    return value == null ? null : value == "true";
  }

// Asynchronous method to securely set an integer value using FlutterSecureStorage.
  Future<void> setSecuredInt(String key, int value) async {
    await _storage.write(key: key, value: value.toString());
  }

// Asynchronous method to securely retrieve an integer value using FlutterSecureStorage.
  Future<int?> getSecuredInt(String key) async {
    final value = await _storage.read(key: key);
    return value == null ? null : int.parse(value);
  }

// Asynchronous method to securely set a double value using FlutterSecureStorage.
  Future<void> setSecuredDouble(String key, double value) async {
    await _storage.write(key: key, value: value.toString());
  }

// Asynchronous method to securely retrieve a double value using FlutterSecureStorage.
  Future<double?> getSecuredDouble(String key) async {
    final value = await _storage.read(key: key);
    return value == null ? null : double.parse(value);
  }

// Asynchronous method to securely set a list of strings using FlutterSecureStorage.
  Future<void> setSecuredStringList(String key, List<String> value) async {
    await _storage.write(key: key, value: value.join(","));
  }

// Asynchronous method to securely retrieve a list of strings using FlutterSecureStorage.
  Future<List<String>?> getSecuredStringList(String key) async {
    final value = await _storage.read(key: key);
    return value?.split(",");
  }

  // Asynchronous method to securely delete a string value using FlutterSecureStorage.
  Future<void> deleteSecuredStorage(String key) async {
    await _storage.delete(key: key);
  }
}
