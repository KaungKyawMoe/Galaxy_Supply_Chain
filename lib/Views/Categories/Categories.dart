import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iOrderApp/Providers/category_provider.dart';
import 'package:iOrderApp/Views/Extensions/CategoryDtoExt.dart';
import 'package:iOrderApp/Views/Products/products.dart';
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
            body: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: GridView.count(
                childAspectRatio: 90/73,
                crossAxisCount: 2,
                children: cateProvider.filteredCategory.map((e){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Products(categoryDto: e,)));
                    },
                      child: e.GetTile(),
                  );
                }).toList(),
              ),
            ),
          ),
        );
  },
  );
  }
}
