
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';
import 'package:iOrderApp/Repositories/category_repo.dart';
import 'package:iOrderApp/Services/ApiResponse.dart';

class CategoryProvider extends ChangeNotifier{

  CategoryRepo categoryRepo;

  CategoryProvider({required this.categoryRepo});

  List<CategoryDto> orgCategory = [];

  List<CategoryDto> filteredCategory = [];

  Future<void> GetCategory() async{

    ApiResponse apiResponse = await categoryRepo.GetCategory();

    if(apiResponse.statusCode == 200){
      var result = jsonDecode(apiResponse.data);
      List<CategoryDto> category = (result as List).map((x) => CategoryDto.fromJson(x)).toList();
      orgCategory = category;
      filteredCategory = orgCategory;
    }

    notifyListeners();
  }

  Future<void> Search(String data) async{
    var filteredCodeList = orgCategory.where((e) => e.name!.toLowerCase().contains(data)).toList();

    if(!filteredCodeList.isEmpty){
      filteredCategory = filteredCodeList;
      notifyListeners();
    }

  }

}