import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';
import 'package:iOrderApp/Providers/product_provider.dart';
import 'package:iOrderApp/Views/Common/SearchBar.dart';
import 'package:iOrderApp/Views/Extensions/UsrCodeDtoExt.dart';
import 'package:iOrderApp/Views/Products/product_details.dart';
import 'package:provider/provider.dart';
class Products extends StatefulWidget {

  CategoryDto? categoryDto;
  Products({this.categoryDto = null});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  bool isInit = true;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if(isInit){
      Provider.of<ProductProvider>(context).GetUsrCode(category: widget.categoryDto);
      isInit = false;
    }

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: widget.categoryDto != null ? AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.categoryDto!.name.toString()),
        ) : null,
        body: Column(
          children:[
            SearchBar(),
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return ListView(
                    shrinkWrap: true,
                    children: productProvider.filteredUsrCodeList.map((e) {
                      return InkWell(
                        onTap: (){
                          //Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetails(e),));
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ProductDetails(e);
                              });
                        },
                        child: e.GetTile(),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ] ,
        ),
      ),
    );
  }
}
