import 'package:dio/dio.dart';
import 'package:iOrderApp/Common/apihelper.dart';
import 'package:iOrderApp/Common/npgsqldbtype.dart';
import 'package:iOrderApp/Common/parameterdirection.dart';
import 'package:iOrderApp/Common/parameterhelper.dart';
import 'package:iOrderApp/Common/sqlexecutiontypes.dart';
import 'package:iOrderApp/Services/ApiClient.dart';
import 'package:iOrderApp/Services/ApiResponse.dart';

class CategoryRepo{

  late ApiClient apiClient;

  CategoryRepo();

  Future<ApiResponse> GetCategory() async{

    ApiHelper apiHelper = ApiHelper();
    apiHelper.StoredProcedureName = "GetMobileCategory";
    apiHelper.IsStoredProcedure = true;
    apiHelper.SqlExecutionType = SqlExecutionTypes.ExecuteResult;
    var parameters = <ParameterHelper>[];
    parameters.add(
        ParameterHelper(
            PsqlParameterName: "_categoryid",
            PsqlDbTypes: NpgsqlDbType.Integer,
            PsqlParameterDirection: ParameterDirection.Input,
            PsqlParameterValue: null
        )
    );
    apiHelper.Parameters = <List<ParameterHelper>>[];
    apiHelper.Parameters!.add(parameters);

    apiClient = ApiClient(Dio());
    ApiResponse response = ApiResponse();
    var json = apiHelper.toJson();
    try{
      response.statusCode = 200;
      var result = await apiClient.Post(json);
      response.data = result;
    }catch(e){
      var res = e as Response;
      response.statusCode = res.statusCode;
      response.statusMessage = res.statusMessage;
    }
    return response;
  }

  Future<ApiResponse> PlaceOrder(ApiHelper apiHelper) async{
    ApiResponse response = ApiResponse();
    var json = apiHelper.toJson();
    try{
      response.statusCode = 200;
      response.data = await apiClient.Post(json);
    }catch(e){
      var res = e as Response;
      response.statusCode = res.statusCode;
      response.statusMessage = res.statusMessage;
    }
    return response;
  }
}