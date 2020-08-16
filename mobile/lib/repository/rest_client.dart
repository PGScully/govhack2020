import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:twp/repository/challenge.dart';
import 'package:twp/repository/location.dart';

part 'rest_client.g.dart';

@RestApi(
    baseUrl: 'https://locations.topdogcommerce.com/index.php/wp-json/wp/v2')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/login')
  Future<String> login({
    @Body() String username,
    @Body() String password,
  });

  @GET("/challenge")
  Future<List<Challenge>> getAllChallenges();

  @GET('/challenge/{id}')
  Future<Challenge> getChallenge({
    @Path("id") String id,
  });

  @GET('/location?per_page=100')
  Future<List<Location>> getAllLocations();

  @GET('/challenge/{id}/locations')
  Future<List<Location>> getLocationsForChallenge({
    @Path("id") String id,
  });

  @PUT('/checkin/{userid}/{locationid}')
  Future<void> checkin({
    @Path("userid") int userid,
    @Path("locationid") int locationid,
  });
}
