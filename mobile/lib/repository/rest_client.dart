import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:twp/repository/challenge.dart';
import 'package:twp/repository/challenge_location.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/challenges")
  Future<List<Challenge>> getChallenges();

  @GET('/challenges/{id}')
  Future<Challenge> getChallenge(@Path("id") String id);

  @GET('/locations')
  Future<List<ChallengeLocation>> getLocations();

  @GET('/locations/{id}')
  Future<List<ChallengeLocation>> getLocationsForChallenge(
      @Path("id") String id);
}
