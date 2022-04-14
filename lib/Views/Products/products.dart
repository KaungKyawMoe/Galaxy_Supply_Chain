import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/product_provider.dart';
import 'package:flutter_app/Views/Products/product_details.dart';
import 'package:provider/provider.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  bool isInit = true;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if(isInit){
      Provider.of<ProductProvider>(context).GetUsrCode();
      isInit = false;
    }

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
                //Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetails(e),));
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ProductDetails(e);
                    });
              },
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade100),
                              ),
                              width: 90,
                              height: 80,
                              child: Image.asset(e.imageurl ?? 'assets/images/default.png'),
                              // child: PhotoView(
                              //   imageProvider:
                              //   AssetImage('assets/images/strawbarry.jpg'),
                              // ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                e.description.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e.saleprice.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),

                            ],
                          ),
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
