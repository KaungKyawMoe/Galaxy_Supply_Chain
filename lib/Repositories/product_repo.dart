import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/apihelper.dart';
import 'package:flutter_app/Services/ApiClient.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class ProductRepo{
  
  late ApiClient apiClient;

  ProductRepo();
  
  Future<ApiResponse> GetProducts(ApiHelper apiHelper) async{
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