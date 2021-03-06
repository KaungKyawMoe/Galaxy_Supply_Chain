import 'package:flutter/material.dart';
import 'package:iOrderApp/Models/ShoppingCartItem.dart';
import 'package:iOrderApp/Providers/shoppingcart_provider.dart';
import 'package:iOrderApp/Views/Common/CustomSmButton.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<ShoppingCartProvider>(
        builder: (context, shoppingCartProvider, child) {
          return shoppingCartProvider.cart.length == 0
              ? Center(
                  child: Text("Cart is Empty"),
                )
              : Column(
                  children: [
                    Expanded(
                      child:  Container(
                        child: shoppingCartProvider.cart.length > 0?
                        ListView.builder(
                          itemCount: shoppingCartProvider.cart.length,
                            itemBuilder: (context,index){
                            ShoppingCartItem item = shoppingCartProvider.cart[index];
                          return Dismissible(
                              direction: DismissDirection.startToEnd,
                                      confirmDismiss: (DismissDirection direction) async {
                                    return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:  const Text("Delete Confirmation",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          content: const Text("Are you sure to delete this item?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: const Text(
                                                'DELETE',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.redAccent),
                                              onPressed: (){
                                                int qty = (item.qty ?? 0) - int.parse(item.qty.toString());
                                                shoppingCartProvider
                                                    .UpdateQty(item, qty);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            ElevatedButton(
                                              child: const Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.indigoAccent),
                                              onPressed: () => Navigator.of(context).pop(),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                              key: UniqueKey(),
                            child:Card(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    0, 0, 12, 0),
                                                child: Container(
                                                  child: Image.asset(
                                                    'assets/images/heartbracelet.jpg',
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  width: 120,
                                                  height: 100,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                       item.usrcode.description
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black87),
                                                      ),
                                                      Text(
                                                        "" +
                                                            NumberFormat.decimalPattern(
                                                                    'en_us')
                                                                .format((item.unitType ??
                                                                            0) >
                                                                        0
                                                                    ? item.usrcode.units!
                                                                        .where((x) =>
                                                                            x.unittype ==
                                                                            item.unitType)
                                                                        .first
                                                                        .saleprice
                                                                    : item.usrcode
                                                                        .saleprice) +
                                                            " MMK",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black54),
                                                      ),
                                                      (item.unitType ?? 0) == 0
                                                          ? SizedBox.shrink()
                                                          : Text(
                                                              "unit : " +
                                                                  item.usrcode.units!
                                                                      .where((x) =>
                                                                          x.unittype ==
                                                                          item.unitType)
                                                                      .first
                                                                      .shortdesc
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight.bold,
                                                                  color:
                                                                      Colors.black54),
                                                            ),
                                                      //Button
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                        children: [
                                                          //Remove
                                                          CustomSmButton(
                                                              Icon(Icons.remove), () {
                                                            int qty = (item.qty ?? 0) - 1;
                                                            shoppingCartProvider
                                                                .UpdateQty(item, qty);
                                                          }),

                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(5.0),
                                                            child: Text(
                                                              '${item.qty}',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),

                                                          CustomSmButton(
                                                              Icon(Icons.add), () {
                                                            int qty = (item.qty ?? 0) + 1;
                                                            shoppingCartProvider
                                                                .UpdateQty(item, qty);
                                                          }),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                          );
                        })
                       : Center(child: Text('No Items')),

                      ),
                    ),

                    Container(
                        width: double.infinity,
                        color: Colors.black12,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,4,12,4),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SummaryText("Qty : ")
                                    ],
                                  )),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SummaryAmount(NumberFormat.decimalPattern('en_us').format(shoppingCartProvider.totalQty)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,12,0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SummaryText("Amount : ")
                                    ],
                                  )),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SummaryAmount(NumberFormat.decimalPattern('en_us').format(shoppingCartProvider.totalAmount)+" MMK"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12,6,12,4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                        child: const Text("Confirm Order",style:
                                          TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Theme.of(context).primaryColor,

                                        ),
                                        onPressed: () {
                                          shoppingCartProvider.CheckOutOrder()
                                              .then((value) {
                                            if (value) {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Check Out'), // To display the title it is optional
                                                    content: const Text(
                                                      'Order is confirmed successfully !',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                      ),
                                                    ), // Message which will be pop up on the screen
                                                    // Action widget which will provide the user to acknowledge the choice
                                                    actions: [
                                                      FlatButton(
                                                        textColor: Colors.black,
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder:(context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Check Out'), // To display the title it is optional
                                                    content: const Text(
                                                      'Error occurs !',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ), // Message which will be pop up on the screen
                                                    // Action widget which will provide the user to acknowledge the choice
                                                    actions: [
                                                      FlatButton(
                                                        textColor: Colors.black,
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          });
                                        }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ))

                  ],
                );
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget SummaryText(String data) {
  return Text(data,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ));
}

// ignore: non_constant_identifier_names
Widget SummaryAmount(String data) {
  return Text(data,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ));
}
