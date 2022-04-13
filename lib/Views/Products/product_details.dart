import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/UnitDto.dart';
import 'package:flutter_app/Models/UsrCodeDto.dart';
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

  void CalculateAmount(){
    setState((){
      if(selectedUnitType > 0){
        price = qty * unitList.where((x) => x.unittype == selectedUnitType).first.saleprice!.toDouble();
      }
      else{
        price = qty * usrCode.saleprice!.toDouble();
      }
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(usrCode.description.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/default.png',
            fit: BoxFit.fill,
            height: 300,
            width: double.infinity,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[

                  Text(usrCode.description.toString(),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),

                  Text(price.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children : unitList.isEmpty ? [] :
                          unitList.map((x) {
                            return InkWell(
                              onTap: (){
                                  selectedUnitType = x.unittype!.toInt();
                                  CalculateAmount();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0),
                                padding: EdgeInsets.all(0.0),
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  border: Border.all(color: Colors.lightBlue),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5.0),
                                      child: Text(x.shortdesc.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                    ),
                                  selectedUnitType != x.unittype!.toInt() ? SizedBox.shrink() :
                                  Positioned(
                                    top: 5,
                                    right: 10.0,
                                    child: Icon(
                                      Icons.check_circle_outline_outlined,
                                      color:Colors.lightBlue,
                                      size: 24,
                                    ),
                                  ),
                                ],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),

                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: (){
                              qty++;
                              CalculateAmount();
                          },
                          child: Icon(Icons.add)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(qty.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            if(qty > 1){
                              qty--;
                              CalculateAmount();
                            }
                          },
                          child: Icon(Icons.remove)),
                    ],
                  ),

                ]
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ElevatedButton(
          onPressed: (){},
          child: SizedBox(
            width: double.infinity,
            child: Text("Add To Cart",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,)),
        ),
      )
    );
  }
}
