import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/ShoppingCartItem.dart';
import 'package:flutter_app/Models/UnitDto.dart';
import 'package:flutter_app/Models/UsrCodeDto.dart';
import 'package:flutter_app/Providers/shoppingcart_provider.dart';
import 'package:provider/provider.dart';
class ProductDetails extends StatefulWidget {


  UsrCodeDto usrCode;

  ProductDetails(this.usrCode);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  late UsrCodeDto usrCode;

  late List<UnitDto> unitList;

  int qty = 1;

  double price = 0;

  int selectedUnitType = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    usrCode = widget.usrCode;

    unitList = usrCode.units == null ? [] : usrCode.units!;

    if(unitList.isNotEmpty){
      selectedUnitType = int.parse(unitList.first.unittype.toString());
    }

    CalculateAmount();

  }

  void add() {
      qty++;
      CalculateAmount();
  }

  void remove() {
      if (qty > 1) {
        qty--;
      }
      CalculateAmount();
  }

  void CalculateAmount(){
    setState((){
      if(selectedUnitType > 0){
        price = qty * unitList.where((x) => x.unittype == selectedUnitType).first.saleprice!.toDouble();
      }
      else{
        price = qty * ( usrCode.saleprice ?? 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            // color: Colors.black12,
            width: 200,
            height: 150,
            child: Image.asset(usrCode.imageurl ?? 'assets/images/default.png'),
            // child: PhotoView(
            //   imageProvider: AssetImage('assets/images/strawbarry.jpg'),
            // ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  usrCode.description.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '$price MMK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),

              unitList.length == 0 ? SizedBox.shrink() :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: unitList.map((x){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints:
                      BoxConstraints.tightFor(width: 55, height: 24),
                      child: OutlinedButton(
                        onPressed: null,
                        child: Text(x.shortdesc.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black12),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: 55, height: 30),
                    child: ElevatedButton(
                      child: const Text(
                        '-',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      style:
                      ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: remove,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      '$qty',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                      onPressed: add,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints:
                BoxConstraints.tightFor(width: 180, height: 42),
                child: ElevatedButton(
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  onPressed: () {
                    ShoppingCartItem item = ShoppingCartItem(usrcode: usrCode);
                    item.qty = qty;
                    item.unitType = selectedUnitType;

                    Provider.of<ShoppingCartProvider>(context,listen:false).AddToCart(item);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
