class NetworkConstants {
  static const Duration connectionTimeout = Duration(seconds: 60); // 60 seconds
  static const Duration receiveTimeout = Duration(seconds: 60); // 60 seconds
  static const Duration sendTimeout = Duration(seconds: 60); // 60 seconds

  static const String apiUrl = 'http://192.168.42.3:8080/api/';
  static const String basicAuth = 'admin:admin';
}