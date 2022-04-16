
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';
import 'package:iOrderApp/Models/UsrCodeDto.dart';
import 'package:iOrderApp/Repositories/product_repo.dart';
import 'package:iOrderApp/Services/ApiResponse.dart';

class ProductProvider extends ChangeNotifier{

  ProductRepo productRepo;

  ProductProvider({required this.productRepo});

  List<UsrCodeDto> filteredUsrCodeList = [];

  List<UsrCodeDto> orgUsrCodeList = [];

  Future<void> GetUsrCode({CategoryDto? category = null}) async{

    ApiResponse apiResponse = await productRepo.GetProducts();

    if(apiResponse.statusCode == 200){
      var result = jsonDecode(apiResponse.data);
      List<UsrCodeDto> usrCodes = (result as List).map((x) => UsrCodeDto.fromJson(x)).toList();
      orgUsrCodeList = usrCodes;
      filteredUsrCodeList = orgUsrCodeList;
    }

    if(category != null){
      var filteredCodeList = orgUsrCodeList.where((e) => e.categoryid == category.categoryid).toList();

      if(filteredCodeList.isNotEmpty){
        orgUsrCodeList = filteredCodeList;
        filteredUsrCodeList = filteredCodeList;
      }
    }

    notifyListeners();
  }

  Future<void> Search(String data) async{
     var filteredCodeList = orgUsrCodeList.where((e) => e.description!.toLowerCase().contains(data)).toList();

     if(!filteredCodeList.isEmpty){
       filteredUsrCodeList = filteredCodeList;
       notifyListeners();
     }

  }

}