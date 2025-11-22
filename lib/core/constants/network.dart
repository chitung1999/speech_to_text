class NetworkConstants {
  static const Duration connectionTimeout = Duration(seconds: 60); // 60 seconds
  static const Duration receiveTimeout = Duration(seconds: 60); // 60 seconds
  static const Duration sendTimeout = Duration(seconds: 60); // 60 seconds

  static const String apiUrl = 'https://cmc.threecall.com/';
  static const String basicAuth = 'cmcg.3call:Cmcg@2025';
}