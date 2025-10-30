import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart'; // generated file

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
}


// --------------------------------------------------
  // 🧩 Example Endpoints
  // --------------------------------------------------

  // @GET('/users')
  // Future<List<dynamic>> getUsers();

  // @GET('/users/{id}')
  // Future<Map<String, dynamic>> getUserById(@Path('id') int id);

  // @POST('/login')
  // Future<Map<String, dynamic>> login(@Body() Map<String, dynamic> body);

  // @POST('/register')
  // Future<Map<String, dynamic>> register(@Body() Map<String, dynamic> body);

  // @PUT('/users/{id}')
  // Future<Map<String, dynamic>> updateUser(
  //   @Path('id') int id,
  //   @Body() Map<String, dynamic> body,
  // );

  // @DELETE('/users/{id}')
  // Future<void> deleteUser(@Path('id') int id);