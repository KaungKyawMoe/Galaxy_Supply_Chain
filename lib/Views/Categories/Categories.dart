import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'aye san phyu',
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
