
import 'dart:convert';
import 'package:flutter/cupertino.dart';
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

      var usersData = jsonDecode(response.data);

      List<UserDto> userList = (usersData as List).map((x) => UserDto.fromJson(x)).toList();

      if((userList.first.password.toString() == "null" ? "" : userList.first.password.toString()) == _user.password.toString()){
        user = userList.first;
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