
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Common/apihelper.dart';
import 'package:flutter_app/Common/npgsqldbtype.dart';
import 'package:flutter_app/Common/parameterdirection.dart';
import 'package:flutter_app/Common/parameterhelper.dart';
import 'package:flutter_app/Common/sqlexecutiontypes.dart';
import 'package:flutter_app/Models/UsrCodeDto.dart';
import 'package:flutter_app/Repositories/product_repo.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class ProductProvider extends ChangeNotifier{

  ProductRepo productRepo;

  ProductProvider({required this.productRepo});

  List<UsrCodeDto> usrCodeList = [];

  Future<void> GetUsrCode() async{
    ApiHelper apiHelper = ApiHelper();
    apiHelper.StoredProcedureName = "GetMobileUsrCode";
    apiHelper.IsStoredProcedure = true;
    apiHelper.SqlExecutionType = SqlExecutionTypes.ExecuteResult;
    var parameters = <ParameterHelper>[];
    parameters.add(
      ParameterHelper(
        PsqlParameterName: "_usercode",
        PsqlDbTypes: NpgsqlDbType.Varchar,
        PsqlParameterDirection: ParameterDirection.Input,
        PsqlParameterValue: null
      )
    );
    apiHelper.Parameters = <List<ParameterHelper>>[];
    apiHelper.Parameters!.add(parameters);
    ApiResponse apiResponse = await productRepo.GetProducts(apiHelper);

    if(apiResponse.statusCode == 200){
      var result = jsonDecode(apiResponse.data);
      List<UsrCodeDto> usrCodes = (result as List).map((x) => UsrCodeDto.fromJson(x)).toList();
      usrCodeList = usrCodes;

    }

    notifyListeners();
  }

}