
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';

extension CategoryDtoExt on CategoryDto{

  Widget GetTile(){
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Column(
          children: [
            Container(
              // color: Colors.black12,
                height: 100,
                child: Image.asset('assets/images/heartbracelet.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,)

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
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
      ),
    );
  }

}