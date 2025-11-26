import 'package:dio/dio.dart';
import 'package:speech_to_text/core/constants/network.dart';
import 'package:speech_to_text/domain/di/di.config.dart';
import 'package:speech_to_text/domain/network/interceptor_app.dart';
import 'package:speech_to_text/domain/network/rest_client.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.asNewInstance()..allowReassignment = true;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> setupLocator() async {
  Dio dio = Dio();
  dio.interceptors.add(InterceptorApp());
  dio.options
    ..connectTimeout = (NetworkConstants.connectionTimeout)
    ..receiveTimeout = (NetworkConstants.receiveTimeout)
    ..sendTimeout = (NetworkConstants.sendTimeout)
    ..headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Basic ${base64Encode(utf8.encode(NetworkConstants.basicAuth))}',
    }
    ..followRedirects = false;

  // Register Dio instance
  getIt.registerSingleton<Dio>(dio);

  // Register RestClient instance
  getIt.registerSingleton<RestClient>(
    RestClient(getIt<Dio>(), baseUrl: NetworkConstants.apiUrl),
  );

  // Initialize the generated dependencies
  await getIt.init();
}