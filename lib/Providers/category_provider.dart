
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/CategoryDto.dart';
import 'package:flutter_app/Repositories/category_repo.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class CategoryProvider extends ChangeNotifier{

  CategoryRepo categoryRepo;

  CategoryProvider({required this.categoryRepo});

  List<CategoryDto> categoryid = [];

  List<CategoryDto> name= [];

  Future<void> GetCategory() async{

    ApiResponse apiResponse = await categoryRepo.GetCategory();

    if(apiResponse.statusCode == 200){
      var result = jsonDecode(apiResponse.data);
      List<CategoryDto> category = (result as List).map((x) => CategoryDto.fromJson(x)).toList();
      categoryid = categoryid;
      name = name;
    }

    notifyListeners();
  }

  Future<void> Search(String data) async{
    var filteredCodeList = name.where((e) => e.name!.toLowerCase().contains(data)).toList();

    if(!filteredCodeList.isEmpty){
      name = filteredCodeList;
      notifyListeners();
    }

  }

}