
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Models/ShoppingCartItem.dart';

class ShoppingCartProvider extends ChangeNotifier{

  List<ShoppingCartItem> cart = [];

  int totalQty = 0;

  double totalAmount = 0;

  void CalculateSummary(){

    totalQty = 0;
    totalAmount = 0;

    cart.forEach((e) {
      totalQty += e.qty ?? 0;
      double salePrice = 0;
      salePrice = (e.unitType ?? 0 ) == 0 ? e.usrcode.saleprice ?? 0 :
      e.usrcode.units!.where((item) => item.unittype == e.unitType).first.saleprice ?? 0;
      totalAmount += (e.qty ?? 0) * salePrice;
    });
  }

  bool AddToCart(ShoppingCartItem item){
    cart.add(item);
    CalculateSummary();
    notifyListeners();
    return true;
  }

  bool RemoveFromCart(ShoppingCartItem item){
    cart.remove(item);
    CalculateSummary();
    notifyListeners();
    return true;
  }


  bool UpdateQty(ShoppingCartItem item,int qty){

    if(qty == 0){
      cart.remove(item);
    }
    else{
      cart.where((e) => e.usrcode.usrcode == item.usrcode.usrcode).first.qty = qty;
    }
    CalculateSummary();
    notifyListeners();
    return true;
  }

  Future<bool> CheckOutOrder() async{
    cart.clear();
    CalculateSummary();
    notifyListeners();
    return true;
  }
}