import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/shoppingcart_provider.dart';
import 'package:provider/provider.dart';
class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(
      builder: (context, shoppingCartProvider, child) {
        return ListView(
          children: shoppingCartProvider.cart.map((e){
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*
                          Image.network(e.imageurl.toString(),
                            width: 100,
                            height: 50,),
                           */
                      Image.asset('assets/images/default.png',
                        height: 100,width: 100,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.usrcode.description.toString(),
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            Text(e.qty.toString()+" * "+
                                (e.unitType!.toInt() > 0 ?
                                e.usrcode.units!.where((x) => x.unittype == e.unitType).first.saleprice.toString() :
                                e.usrcode.saleprice.toString()),
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.restore_from_trash),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
