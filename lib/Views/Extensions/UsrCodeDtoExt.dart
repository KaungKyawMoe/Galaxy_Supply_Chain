
import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/UsrCodeDto.dart';

extension UsrCodeDtoExt on UsrCodeDto{

  Widget GetTile(){
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children:[
                  Container(
                    width: 120,
                    height: 100,
                    child: Image.asset(imageurl ?? 'assets/images/jewel.jpg'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      description.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      saleprice.toString(),
                      style: TextStyle(
                          fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

}
