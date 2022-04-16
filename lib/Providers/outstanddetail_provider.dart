

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/OutstandDetailDto.dart';
import 'package:flutter_app/Repositories/outstanddetail_repo.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class OutstandDetailProvider extends ChangeNotifier{

  List<OutstandDetailDto> outstanddetailList = [];

  double totalAmount = 0;

  late OutstandDetailRepo detailRepo;

  OutstandDetailProvider({required this.detailRepo});

  Future<void> GetOutstandsDetail(int customerId,int saletranid) async {
    ApiResponse response = await detailRepo.GetOutstandDetail(customerId,saletranid);
    if(response.statusCode == 200){
      var outstanddetaildata = jsonDecode(response.data);
      outstanddetailList = (outstanddetaildata as List).map((e) => OutstandDetailDto.fromJson(e)).toList();

      totalAmount = 0;

      outstanddetailList.forEach((x) {
        totalAmount += x.amount ?? 0;
      });

      notifyListeners();
    }
  }

}