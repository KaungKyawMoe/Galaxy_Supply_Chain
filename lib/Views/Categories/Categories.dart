import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/category_provider.dart';
import 'package:flutter_app/Views/Extensions/CategoryDtoExt.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  bool isInit = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if(isInit){
      Provider.of<CategoryProvider>(context,listen: false).GetCategory();
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<CategoryProvider>(
      builder: (context, cateProvider, child) {
        return SafeArea(
          child: Scaffold(
            body: GridView.count(
              childAspectRatio: 90/73,
              crossAxisCount: 2,
              children: cateProvider.filteredCategory.map((e){
                return e.GetTile();
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
