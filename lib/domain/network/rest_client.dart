import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:speech_to_text/domain/models/login/login_response.dart';
import 'package:speech_to_text/domain/models/record/record_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // @GET("api/Coupon/List")
  // Future<dynamic> getUser(@Query("UserId") String id);

  @POST("auth/login/account")
  Future<LoginResponse> onLogin(@Body() Map<String, dynamic> body);

  @POST("whisper/transcribe")
  @MultiPart()
  Future<RecordResponse> onSpeechToText(@Part(name: "file") MultipartFile file);
}