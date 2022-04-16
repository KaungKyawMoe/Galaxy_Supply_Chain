import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iOrderApp/Views/Products/product_details.dart';
import 'package:photo_view/photo_view.dart';


class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8,0,4,0),
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16.0, 0,8,0),
                                child: Container(
                                    color: Colors.black12,
                                    width: 75,
                                    height: 80,
                                    child: PhotoView(
                                      imageProvider: AssetImage(
                                          'assets/images/strawbarry.jpg'),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0,2.0,0,4),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "Pineapple",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0, 0, 4),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "1000MMK",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints.tightFor(
                                                width: 40, height: 26),
                                            child: ElevatedButton(
                                              child: const Text(
                                                '-',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.white),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 40, height: 26),
                                          child: ElevatedButton(
                                            child: const Text(
                                              '+',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Container(
                    width: 80,
                    child: Column(
                      children: [
                        Text(
                          "1000000",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "MMK",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),

            ],

          ),
          Divider()
        ],
      ),
    );
  }
}
