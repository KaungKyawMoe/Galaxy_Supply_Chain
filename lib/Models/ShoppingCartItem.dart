
import 'UsrCodeDto.dart';

class ShoppingCartItem{

  UsrCodeDto usrcode;

  int? qty;

  int? unitType;

  ShoppingCartItem({required this.usrcode,this.qty,this.unitType});
}