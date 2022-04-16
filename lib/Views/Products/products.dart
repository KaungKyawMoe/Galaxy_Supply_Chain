import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/product_provider.dart';
import 'package:flutter_app/Views/Common/SearchBar.dart';
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

    return SafeArea(
      child: Scaffold(
        body: Column(
          children:[
            SearchBar(),
            Expanded(
              child: Consumer<ProductProvider>(
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
                        child: Padding(

                          padding: const EdgeInsets.fromLTRB(8,1,8,1),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children:[
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.only(
                                        //       topLeft: Radius.circular(5),
                                        //       bottomLeft: Radius.circular(5),
                                        //     ),
                                        //     color: Theme.of(context).accentColor,
                                        //   ),
                                        //   width: 5,
                                        //   height:100,
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Container(
                                            width: 100,
                                            height: 95,
                                            child: Image.asset(e.imageurl ?? 'assets/images/jewel.jpg',width: double.infinity,fit: BoxFit.cover,),
                                            // child: PhotoView(
                                            //   imageProvider:
                                            //   AssetImage('assets/images/strawbarry.jpg'),
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 8, 8, 8),
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
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ] ,
        ),
      ),
    );
  }
}
