import 'package:dio/dio.dart';
import 'package:iOrderApp/Common/apihelper.dart';
import 'package:iOrderApp/Common/npgsqldbtype.dart';
import 'package:iOrderApp/Common/parameterdirection.dart';
import 'package:iOrderApp/Common/parameterhelper.dart';
import 'package:iOrderApp/Common/sqlexecutiontypes.dart';
import 'package:iOrderApp/Services/ApiClient.dart';
import 'package:iOrderApp/Services/ApiResponse.dart';

class OutstandDetailRepo{

  late ApiClient apiClient;

  OutstandDetailRepo();

  Future<ApiResponse> GetOutstandDetail(int customerId,int saletranid) async{

    ApiHelper apiHelper = ApiHelper();
    apiHelper.StoredProcedureName = "getmobileoutstandingdetail";
    apiHelper.IsStoredProcedure = true;
    apiHelper.SqlExecutionType = SqlExecutionTypes.ExecuteResult;
    var parameters = <ParameterHelper>[];
    parameters.add(
        ParameterHelper(
            PsqlParameterName: "_customerid",
            PsqlDbTypes: NpgsqlDbType.Integer,
            PsqlParameterDirection: ParameterDirection.Input,
            PsqlParameterValue: customerId,
        )
    );
    parameters.add(
        ParameterHelper(
            PsqlParameterName: "_saletranid",
            PsqlDbTypes: NpgsqlDbType.Integer,
            PsqlParameterDirection: ParameterDirection.Input,
            PsqlParameterValue: saletranid
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