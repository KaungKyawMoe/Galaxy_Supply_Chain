import 'package:flutter/material.dart';
class CustomSmButton extends StatelessWidget {

  Function() click;

  Icon icon;

  CustomSmButton(this.icon,this.click);

  @override
  Widget build(BuildContext context) {
    return //Add Button
      InkWell(
        onTap: click,
        child: Card(
          child: Container(
            width: 40,
            height:25,
            child:Center(child: icon),
          ),
        ),
      );
  }
}
