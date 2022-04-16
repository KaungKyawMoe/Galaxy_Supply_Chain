import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:iOrderApp/Models/ShoppingCartItem.dart';
import 'package:iOrderApp/Models/UnitDto.dart';
import 'package:iOrderApp/Models/UsrCodeDto.dart';
import 'package:iOrderApp/Providers/shoppingcart_provider.dart';
import 'package:iOrderApp/Views/Common/CustomSmButton.dart';
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

  UnitDto selectedUnitDto = UnitDto();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    usrCode = widget.usrCode;

    unitList = usrCode.units == null ? [] : usrCode.units!;

    if(unitList.isNotEmpty){
      selectedUnitDto = unitList.first;
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
          padding: EdgeInsets.all(3),
          child: Container(
            // color: Colors.black12,
            width: 200,
            height: 150,
            child: Image.asset(usrCode.imageurl ?? 'assets/images/jewel.jpg'),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
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
                padding: EdgeInsets.symmetric(vertical: 2),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: unitList.map((x){
                  return Expanded(
                    child: RadioListTile<UnitDto>(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                        title: Text(x.shortdesc.toString()),
                        value: x,
                        groupValue: selectedUnitDto,
                        onChanged: (value) {
                          setState(() {
                            selectedUnitDto = value as UnitDto;
                          });
                        }),
                  );
                }).toList(),
              ),


              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //Remove Button
                    //Add Button
                    CustomSmButton(Icon(Icons.remove), remove),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '$qty',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //Add Button
                    CustomSmButton(Icon(Icons.add), add),
                  ],
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4),
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
                    item.unitType = selectedUnitDto.unittype;

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
