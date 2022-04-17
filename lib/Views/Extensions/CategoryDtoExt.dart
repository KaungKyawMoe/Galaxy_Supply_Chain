
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';

extension CategoryDtoExt on CategoryDto{

  Widget GetTile(){
    return  Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // color: Colors.black12,
              height: 100,
              child: Image.asset('assets/images/smoothie.webp',
                width: double.infinity,
                fit: BoxFit.cover,)

          ),
          Center(
            child: Text(
              name.toString(),
              textAlign : TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }

}