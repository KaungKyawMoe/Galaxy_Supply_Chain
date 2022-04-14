
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/ShoppingCartItem.dart';

class ShoppingCartProvider extends ChangeNotifier{

  List<ShoppingCartItem> cart = [];

  bool AddToCart(ShoppingCartItem item){
    cart.add(item);
    notifyListeners();
    return true;
  }

  Future<bool> CheckOutOrder() async{
    return true;
  }
}