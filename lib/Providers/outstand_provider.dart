

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iOrderApp/Models/OutstandDto.dart';
import 'package:iOrderApp/Repositories/outstand_repo.dart';
import 'package:iOrderApp/Services/ApiResponse.dart';

class OutstandProvider extends ChangeNotifier{

  List<OutstandDto> outstandList = [];

  double totalAmount = 0;

  late OutstandRepo repo;
  
  OutstandProvider({required this.repo});

  Future<void> GetOutstands(int customerId) async {
    ApiResponse response = await repo.GetOutstands(customerId);
    if(response.statusCode == 200){
      var outstanddata = jsonDecode(response.data);
      outstandList = (outstanddata as List).map((e) => OutstandDto.fromJson(e)).toList();

      totalAmount = 0;

      outstandList.forEach((x) {
        totalAmount += x.amount ?? 0;
      });

      notifyListeners();
    }
  }

}