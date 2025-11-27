class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  late String? _username;
  late String? _fullName;

  void setUsername(String username) {
    _username = username;
  }

  String? getUsername() => _username;

  void setFullName(String fullName) {
    _fullName = fullName;
  }

  String? getFullName() => _fullName;
}

AppConfig appConfig = AppConfig();