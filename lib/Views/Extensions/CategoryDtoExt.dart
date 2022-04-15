
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/CategoryDto.dart';

extension CategoryDtoExt on CategoryDto{

  Widget GetTile(){
    return  Card(
      child: Column(
        children: [
          Container(
            // color: Colors.black12,
              height: 100,
              child: Image.asset('assets/images/smoothie.webp',
                width: double.infinity,
                fit: BoxFit.cover,)

          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 6),
            child: Text(
              name.toString(),
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