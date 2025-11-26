import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

@LazySingleton()
class SharedPreferencesApp {
  final SharedPreferences sharedPreferences;

  SharedPreferencesApp({required this.sharedPreferences});

  /// return [true] if the record is logged in, otherwise [false]
  Future<bool> setLoginStatus(bool isLoggedIn) =>
      sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  Future<bool> getLoginStatus() async =>
      sharedPreferences.getBool('isLoggedIn') ?? false;

  /// refer core/enums/language: 0-en, 1-vi
  Future<bool> setLanguage(String language) =>
      sharedPreferences.setString('language', language);
  Future<String> getLanguage() async =>
      sharedPreferences.getString('language') ?? 'en';
}