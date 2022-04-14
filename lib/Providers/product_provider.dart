
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/UsrCodeDto.dart';
import 'package:flutter_app/Repositories/product_repo.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class ProductProvider extends ChangeNotifier{

  ProductRepo productRepo;

  ProductProvider({required this.productRepo});

  List<UsrCodeDto> usrCodeList = [];

  List<UsrCodeDto> orgUsrCodeList = [];

  Future<void> GetUsrCode() async{

    ApiResponse apiResponse = await productRepo.GetProducts();

    if(apiResponse.statusCode == 200){
      var result = jsonDecode(apiResponse.data);
      List<UsrCodeDto> usrCodes = (result as List).map((x) => UsrCodeDto.fromJson(x)).toList();
      orgUsrCodeList = usrCodes;
      usrCodeList = orgUsrCodeList;
    }

    notifyListeners();
  }

  Future<void> Search(String data) async{
     var filteredCodeList = orgUsrCodeList.where((e) => e.description!.toLowerCase().contains(data)).toList();

     if(!filteredCodeList.isEmpty){
       usrCodeList = filteredCodeList;
       notifyListeners();
     }

  }

}