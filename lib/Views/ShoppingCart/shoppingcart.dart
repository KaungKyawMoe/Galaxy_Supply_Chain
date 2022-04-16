import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/shoppingcart_provider.dart';
import 'package:flutter_app/Views/Common/CustomSmButton.dart';
import 'package:flutter_app/Views/ShoppingCart/shoppingcartitem.dart';
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
          return shoppingCartProvider.cart.length == 0 ?
            Center(
              child : Text("Cart is Empty"),
            ) :
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: shoppingCartProvider.cart.map((e){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,2,8,0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,12,0),
                                    child: Container(
                                      child: Image.asset('assets/images/jewel.jpg',
                                       width: double.infinity,fit: BoxFit.cover,),
                                      width: 120,
                                      height:100,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(e.usrcode.description.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87
                                            ),
                                          ),
                                          Text("" +NumberFormat.decimalPattern('en_us').format((e.unitType ?? 0) > 0 ?
                                              e.usrcode.units!.where((x) => x.unittype == e.unitType).first.saleprice :
                                              e.usrcode.saleprice)+"MMK",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                            ),
                                          ),
                                          ( e.unitType ?? 0 ) == 0 ? SizedBox.shrink() :
                                          Text("unit : "+e.usrcode.units!.where((x) => x.unittype == e.unitType).first.shortdesc.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                            ),
                                          ),
                                          //Button
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              //Remove
                                              CustomSmButton(Icon(Icons.remove), (){
                                                int qty = (e.qty ?? 0) - 1;
                                                shoppingCartProvider.UpdateQty(e, qty);
                                              }),

                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text(
                                                  '${e.qty}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),

                                              //Add
                                              /*
                                              ConstrainedBox(
                                                constraints:
                                                BoxConstraints.tightFor(width: 55, height: 30),
                                                child: ElevatedButton(
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  style:
                                                  ElevatedButton.styleFrom(primary: Colors.white),
                                                  onPressed: (){
                                                    int qty = (e.qty ?? 0) + 1;
                                                    shoppingCartProvider.UpdateQty(e, qty);
                                                  },
                                                ),
                                              ),
                                              */
                                              CustomSmButton(Icon(Icons.add), (){
                                                int qty = (e.qty ?? 0) + 1;
                                                shoppingCartProvider.UpdateQty(e, qty);
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
                    }).toList(),
                  ),
                ),

                Container(
                  color: Theme.of(context).focusColor,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SummaryText("Total Qty"),
                          SummaryText("Total Amount"),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SummaryText("${shoppingCartProvider.totalQty}"),
                              SummaryText(NumberFormat.decimalPattern('en_us').format(shoppingCartProvider.totalAmount)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                          ),
                          onPressed: (){
                            shoppingCartProvider.CheckOutOrder().then((value) {
                              if(value){

                                AlertDialog(
                                  title: Text('Check Out'),  // To display the title it is optional
                                  content: Text('Order is confirmed successfully !',
                                    style:TextStyle(
                                      color: Colors.green,
                                    ),),   // Message which will be pop up on the screen
                                  // Action widget which will provide the user to acknowledge the choice
                                  actions: [
                                    FlatButton(
                                      textColor: Colors.black,
                                      onPressed: () {},
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              }else{
                                AlertDialog(
                                  title: Text('Check Out'),  // To display the title it is optional
                                  content: Text('Error occurs !',
                                  style:TextStyle(
                                    color: Colors.red,
                                  ),
                                  ),   // Message which will be pop up on the screen
                                  // Action widget which will provide the user to acknowledge the choice
                                  actions: [
                                    FlatButton(
                                      textColor: Colors.black,
                                      onPressed: () {},
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              }
                            });
                          },
                          child: Text("Confirm Order"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}

Widget SummaryText(String data){
  return Text(
    data,
    style:TextStyle(
      color:Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    )
  );
}
