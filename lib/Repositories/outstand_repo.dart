
import 'package:dio/dio.dart';
import 'package:iOrderApp/Common/apihelper.dart';
import 'package:iOrderApp/Common/npgsqldbtype.dart';
import 'package:iOrderApp/Common/parameterdirection.dart';
import 'package:iOrderApp/Common/parameterhelper.dart';
import 'package:iOrderApp/Common/sqlexecutiontypes.dart';
import 'package:iOrderApp/Models/OutstandDto.dart';
import 'package:iOrderApp/Services/ApiClient.dart';
import 'package:iOrderApp/Services/ApiResponse.dart';

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