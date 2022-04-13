import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/product_provider.dart';
import 'package:flutter_app/Views/Products/product_details.dart';
import 'package:provider/provider.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Provider.of<ProductProvider>(context).GetUsrCode();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return ListView(
          shrinkWrap: true,
          children: productProvider.usrCodeList.map((e) {
            return InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetails(e),));
              },
              child: Card(
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
                              Text(e.description.toString(),
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                              Text(e.saleprice.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                                onPressed: (){},
                                child: Text('Add To Cart'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
