

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/OutstandDto.dart';
import 'package:flutter_app/Repositories/outstand_repo.dart';
import 'package:flutter_app/Services/ApiResponse.dart';


class OutstandProvider extends ChangeNotifier{

  List<OutstandDto> outstandList = [];

  late OutstandRepo repo;
  
  OutstandProvider({required this.repo});

  Future<void> GetOutstands(int customerId) async {
    ApiResponse response = await repo.GetOutstands(customerId);
    if(response.statusCode == 200){
      var outstanddata = json.decode(response.data);
      outstandList = (outstanddata as List).map((e) => OutstandDto.fromJson(e)).toList();
      notifyListeners();
    }
  }

}