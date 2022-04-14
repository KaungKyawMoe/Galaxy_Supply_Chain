import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Providers/product_provider.dart';
import 'package:flutter_app/Providers/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

import 'Outstand/outstand.dart';
import 'Products/products.dart';
import 'ShoppingCart/shoppingcart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int countno = 0;

  var widgetTitle = ["Sale","Cart","Outstanding"];

  int selectedIndex = 0;

  List<Widget> widgetList = [
    Products(),
    ShoppingCart(),
    Outstand(),
  ];

  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context,listen:true);

    return Scaffold(
      appBar: selectedIndex > 0 ? AppBar(
        title:Text(widgetTitle[selectedIndex])
      ) :
      AppBar(
        title: Container(
          width: double.infinity,
          child:TextField(
            controller: searchTextController,
            decoration: InputDecoration(
              hintText: 'search ...',
              contentPadding: EdgeInsets.all(2.0),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(
                  color:Colors.black,
                )
              ),
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: (){
                  setState((){
                    searchTextController.text = "";
                    Provider.of<ProductProvider>(context,listen:false).Search("");
                  });
                },
                icon:Icon(Icons.clear)
              ),
            ),
            onSubmitted: (data){
              Provider.of<ProductProvider>(context,listen:false).Search(data);
            },
          )
        ),
      ),
      body:Padding(
        padding: EdgeInsets.all(8.0),
        child: widgetList[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        onTap: (index){
          setState((){
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: "Sale"
          ),
          BottomNavigationBarItem(
              icon: Badge(
                padding: EdgeInsets.all(5.0),
                showBadge: shoppingCartProvider.cart.length > 0 ? true : false,
                badgeContent: Text(
                  shoppingCartProvider.cart.length.toString(),
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 12,
                ),),
                child: Icon(Icons.shopping_cart),
              ),
              label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Outstand"
          ),
        ],
      ),
    );
  }
}
