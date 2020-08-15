import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:twp/repository/challenge.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/challenges")
  Future<List<Challenge>> getChallenges();
}
