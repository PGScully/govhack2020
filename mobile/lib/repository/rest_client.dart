import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:twp/repository/challenge.dart';
import 'package:twp/repository/location.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://govhack.topdogcommerce.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/login')
  Future<String> login(
    @Body() String username,
    @Body() String password,
  );

  @GET("/challenges")
  Future<List<Challenge>> getChallenges();

  @GET('/challenges/{id}')
  Future<Challenge> getChallenge(
    @Path("id") String id,
  );

  @GET('/locations')
  Future<List<Location>> getLocations();

  @GET('/locations/{id}')
  Future<List<Location>> getLocationsForChallenge(
    @Path("id") String id,
  );

  @PUT('/checkin/{userid}/{locationid}')
  Future<void> checkin(
    @Path("userid") int userid,
    @Path("locationid") int locationid,
  );
}
