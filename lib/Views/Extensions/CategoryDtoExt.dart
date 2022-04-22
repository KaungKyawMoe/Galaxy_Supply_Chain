
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';

extension CategoryDtoExt on CategoryDto{

  Widget GetTile(){
    return  Card(
      child: Column(
        children: [
          Container(
            // color: Colors.black12,
              height: 100,
              child: Image.asset('assets/images/heartbracelet.jpg',
                width: double.infinity,
                fit: BoxFit.cover,)

          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}