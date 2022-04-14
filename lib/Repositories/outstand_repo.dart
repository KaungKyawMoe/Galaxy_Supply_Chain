
import 'package:dio/dio.dart';
import 'package:flutter_app/Common/apihelper.dart';
import 'package:flutter_app/Common/npgsqldbtype.dart';
import 'package:flutter_app/Common/parameterdirection.dart';
import 'package:flutter_app/Common/parameterhelper.dart';
import 'package:flutter_app/Common/sqlexecutiontypes.dart';
import 'package:flutter_app/Models/OutstandDto.dart';
import 'package:flutter_app/Services/ApiClient.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class OutstandRepo{

  late ApiClient apiClient;

  OutstandRepo();


  Future<ApiResponse> GetOutstands(int customerId) async{
    ApiHelper apiHelper = ApiHelper();
    apiHelper.StoredProcedureName = 'getmobileoutstanding';
    apiHelper.SqlExecutionType = SqlExecutionTypes.ExecuteResult;
    apiHelper.IsStoredProcedure = true;
    apiHelper.Parameters = <List<ParameterHelper>>[];
    List<ParameterHelper> paramList = <ParameterHelper>[];
    paramList.add(
        ParameterHelper(
            PsqlDbTypes: NpgsqlDbType.Integer,
            PsqlParameterDirection: ParameterDirection.Input,
            PsqlParameterName: '_customerid',
            PsqlParameterValue: customerId
        )
    );
    apiHelper.Parameters!.add(paramList);

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

}