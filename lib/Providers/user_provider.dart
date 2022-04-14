

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Common/apihelper.dart';
import 'package:flutter_app/Models/UserDto.dart';
import 'package:flutter_app/Repositories/user_repo.dart';
import 'package:flutter_app/Services/ApiResponse.dart';

class UserProvider extends ChangeNotifier{

  late UserRepo userRepo;

  UserProvider({required this.userRepo});

  late UserDto user;

  Future<bool> Login(UserDto _user) async {

    ApiResponse response = await userRepo.Login(_user);
    if(response.statusCode == 200){
      var userData = UserDto.fromJson(json.decode(response.data));

      if(userData.password.toString() == _user.password.toString()){
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false;
    }
  }

}