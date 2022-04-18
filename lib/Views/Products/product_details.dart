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

  bool selected = true;

  UnitDto selectedUnitDto = UnitDto();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    usrCode = widget.usrCode;

    unitList = usrCode.units == null ? [] : usrCode.units!;

    if (unitList.isNotEmpty) {
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

  void CalculateAmount() {
    setState(() {
      if (selectedUnitType > 0) {
        price = qty *
            unitList
                .where((x) => x.unittype == selectedUnitType)
                .first
                .saleprice!
                .toDouble();
      } else {
        price = qty * (usrCode.saleprice ?? 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 2, 8, 8),
                  child: Container(
                    color: Colors.black12,
                    width: 270,
                    height: 170,
                    child: Image.asset(
                      usrCode.imageurl ?? 'assets/images/heartbracelet.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              usrCode.description.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$price MMK',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                      unitList.length == 0
                          ? SizedBox.shrink()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: unitList.map((x) {
                                return Container(
                                  width: 80,
                                  height: 56,

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RadioListTile<UnitDto>(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0, vertical: 0),
                                          value: x,
                                          groupValue: selectedUnitDto,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedUnitDto = value as UnitDto;
                                              price = double.parse(selectedUnitDto.saleprice.toString());
                                            });
                                          },
                                        activeColor: Theme.of(context).primaryColor,
                                        title: Text(x.shortdesc.toString(),
                                        style: TextStyle(
                                          color:Colors.black,
                                          fontWeight: FontWeight.bold

                                        ),),

                                      ),
                                    ],
                                  ),
                                  // children: [
                                  //   RadioListTile<UnitDto>(
                                  //       contentPadding: const EdgeInsets.symmetric(
                                  //           horizontal: 5),
                                  //       title: Text(x.shortdesc.toString()),
                                  //       value: x,
                                  //       groupValue: selectedUnitDto,
                                  //       onChanged: (value) {
                                  //         setState(() {
                                  //           selectedUnitDto = value as UnitDto;
                                  //         });
                                  //       }),
                                  // ],
                                );
                              }).toList(),
                            ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Row(
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
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white),
                                onPressed: remove,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
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
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white),
                                onPressed: add,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
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
                                  ShoppingCartItem item =
                                      ShoppingCartItem(usrcode: usrCode);
                                  item.qty = qty;
                                  item.unitType = selectedUnitDto.unittype;

                                  Provider.of<ShoppingCartProvider>(context,
                                          listen: false)
                                      .AddToCart(item);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
