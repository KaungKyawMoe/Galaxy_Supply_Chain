
import 'package:dio/dio.dart';
import 'package:flutter_app/Common/globalhelper.dart';
import 'package:retrofit/http.dart';
part 'ApiClient.g.dart';
@RestApi(baseUrl: GlobalHelper.baseUrl)
abstract class ApiClient{

  factory ApiClient(Dio dio,{String baseUrl}) = _ApiClient;

  @POST('/api/sync')
  Future<dynamic> Post(
      @Body() Map<String,dynamic> data
      );

  @GET('/api/sync')
  Future<dynamic> Get(
      @Body() Map<String,dynamic> data
      );
}