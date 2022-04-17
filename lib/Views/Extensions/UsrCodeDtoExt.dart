
import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/UsrCodeDto.dart';
import 'package:intl/intl.dart';

extension UsrCodeDtoExt on UsrCodeDto{

  Widget GetTile(){
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,2,8,0),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children:[
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(imageurl ?? 'assets/images/heartbracelet.jpg',width: double.infinity,fit: BoxFit.cover,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        description.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,4,0,0),
                        child: Text(
                          // saleprice.toString(),
                          myFormat.format(saleprice)+"MMK",
                          style: TextStyle(
                              fontSize: 17, color: Colors.black54,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
