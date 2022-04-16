import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iOrderApp/Providers/shoppingcart_provider.dart';
import 'package:provider/provider.dart';

import 'Categories/Categories.dart';
import 'Outstand/outstand.dart';
import 'Products/products.dart';
import 'ShoppingCart/shoppingcart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int countno = 0;

  var widgetTitle = ["Products","Categories","Carts","Outstand"];
  List<Widget> widgetList = [
    Products(),
    Categories(),
    ShoppingCart(),
    Outstand()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context,listen:true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widgetTitle[selectedIndex]),
        actions:
        [
          selectedIndex != 2 ?
          InkWell(
            onTap: (){
              setState((){
                selectedIndex = 2;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Badge(
                padding: EdgeInsets.all(4.0),
                showBadge: shoppingCartProvider.cart.length > 0 ? true : false,
                badgeContent: Text(shoppingCartProvider.cart.length.toString(),
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ) : SizedBox.shrink(),
        ]
      ),
      body: widgetList[selectedIndex],
      drawer: Drawer(
        child:ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                    image: AssetImage('assets/images/icon.png',)),
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('iOrder App',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),),
                ],
              ),
            ),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              leading: Icon(Icons.description),
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);

                setState((){
                  selectedIndex = 0;
                });
              },
            ),
            Divider(color: Theme.of(context).dividerColor,),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              leading: Icon(Icons.grid_view),
              title: const Text('Categories'),
              onTap: () {
                Navigator.pop(context);
                setState((){
                  selectedIndex = 1;
                });
              },
            ),
            Divider(color: Theme.of(context).dividerColor,),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              leading: Icon(Icons.shopping_cart),
              title: const Text('Carts'),
              onTap: () {
                Navigator.pop(context);
                setState((){
                  selectedIndex = 2;
                });
              },
            ),
            Divider(color: Theme.of(context).dividerColor,),
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              leading: Icon(Icons.monetization_on),
              title: const Text('Outstand'),
              onTap: () {
                Navigator.pop(context);
                setState((){
                  selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index){
          setState((){
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: "Sale",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.grid_view),
               label: "Categories",
            backgroundColor: Theme.of(context).primaryColor,
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
              label: "Cart",
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Outstand",
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      */
    );
  }
}
