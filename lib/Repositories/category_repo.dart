import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/apihelper.dart';
import 'package:flutter_app/Common/npgsqldbtype.dart';
import 'package:flutter_app/Common/parameterdirection.dart';
import 'package:flutter_app/Common/parameterhelper.dart';
import 'package:flutter_app/Common/sqlexecutiontypes.dart';
import 'package:flutter_app/Services/ApiClient.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

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
            PsqlDbTypes: NpgsqlDbType.Varchar,
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