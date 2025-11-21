import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("api/Coupon/List")
  Future<dynamic> getUser(@Query("UserId") String id);

  // @POST("/RequestGetCreditBillingKey")
  // Future<dynamic> getCreditBillingKey(@Body() Map<String, dynamic> body);
}
