class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  late bool? _loginStatus;

  void setLoginStatus(bool loginStatus) {
    _loginStatus = loginStatus;
  }

  bool getLoginStatus() => _loginStatus ?? false;
}

AppConfig appConfig = AppConfig();