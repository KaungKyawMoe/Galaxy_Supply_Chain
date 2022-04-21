import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/CategoryDto.dart';
import 'package:iOrderApp/Providers/product_provider.dart';
import 'package:iOrderApp/Views/Common/SearchBar.dart';
import 'package:iOrderApp/Views/Extensions/UsrCodeDtoExt.dart';
import 'package:iOrderApp/Views/Products/product_details.dart';
import 'package:provider/provider.dart';

import '../../Providers/shoppingcart_provider.dart';
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context,listen:true);

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
                  // return  Container(
                  //   child: productProvider.filteredUsrCodeList.length > 0?
                  //   ListView.builder(
                  //     itemCount: productProvider.filteredUsrCodeList.length,
                  //       itemBuilder: (context,index){
                  //     return Dismissible(
                  //         direction: DismissDirection.startToEnd,
                  //                 confirmDismiss: (DismissDirection direction) async {
                  //               return await showDialog(
                  //                 context: context,
                  //                 builder: (BuildContext context) {
                  //                   return AlertDialog(
                  //                     title:  Text("Delete Confirmation",
                  //                     style: TextStyle(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold
                  //                     ),),
                  //                     content: const Text("Are you sure you want to delete this item?",
                  //                     style: TextStyle(
                  //                       fontWeight: FontWeight.bold
                  //                     ),),
                  //                     actions: <Widget>[
                  //                       ElevatedButton(
                  //                         child: const Text(
                  //                           'DELETE',
                  //                           style: TextStyle(
                  //                               fontSize: 14,
                  //                               color: Colors.white,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                         style: ElevatedButton.styleFrom(
                  //                             primary: Colors.redAccent),
                  //                         onPressed: () => Navigator.of(context).pop(true),
                  //                       ),
                  //                       ElevatedButton(
                  //                         child: const Text(
                  //                           'CANCEL',
                  //                           style: TextStyle(
                  //                               fontSize: 14,
                  //                               color: Colors.white,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                         style: ElevatedButton.styleFrom(
                  //                             primary: Colors.indigoAccent),
                  //                         onPressed: () => Navigator.of(context).pop(true),
                  //                       ),
                  //                     ],
                  //                   );
                  //                 },
                  //               );
                  //             },
                  //         key: UniqueKey(),
                  //         child:InkWell(
                  //           onTap:(){
                  //             showModalBottomSheet(
                  //                             context: context,
                  //                             builder: (context) {
                  //                               return ProductDetails(productProvider.filteredUsrCodeList[index]);
                  //                             });
                  //           },
                  //             child: productProvider.filteredUsrCodeList[index].GetTile())
                  //     );
                  //   })
                  //       : Center(child: Text('No Items')),
                  //
                  // );
                    // ListView.builder(
                    //   itemBuilder: (context, index) {
                    //
                    //     return Dismissible(
                    //         direction: DismissDirection.startToEnd,
                    //         confirmDismiss: (DismissDirection direction) async {
                    //       return await showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text("Delete Confirmation"),
                    //             content: const Text("Are you sure you want to delete this item?"),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                   onPressed: () => Navigator.of(context).pop(true),
                    //                   child: const Text("Delete")
                    //               ),
                    //               FlatButton(
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //                 child: const Text("Cancel"),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //     key:Key(index.toString()),
                    //     // child: Row(
                    //     //   mainAxisAlignment: MainAxisAlignment.center,
                    //     //   children: [
                    //     //     Container(
                    //     //
                    //     //         child: Text("asp"),
                    //     //       height: 40,
                    //     //     ),
                    //     //   ],
                    //     // )
                    //     child: ShoppingCartItem(1),
                    //     );  }
                    //   );


                },
              ),
            ),
          ] ,
        ),
      ),
    );
  }
}
