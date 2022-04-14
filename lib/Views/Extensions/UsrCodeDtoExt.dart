
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/UsrCodeDto.dart';


extension UsrCodeDtoExt on UsrCodeDto{

  Widget CustomText(String data){

    return Text(
      data,
      style: TextStyle(
        fontSize: 20,
        color: Colors.teal,
      ),
    );

  }

  Widget ListTile(){
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Roll No"),
                CustomText(''.toString()),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Name"),
                CustomText(''.toString()),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("Age"),
                CustomText(''.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
