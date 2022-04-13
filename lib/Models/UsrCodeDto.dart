
import 'package:flutter_app/Models/UnitDto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UsrCodeDto.g.dart';
@JsonSerializable()
class UsrCodeDto{

  @JsonKey(name: 'usrcode')
  String? usrcode;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'categoryid')
  int? categoryid;

  @JsonKey(name: 'saleprice')
  double? saleprice;

  @JsonKey(name: 'shortdesc')
  String? shortdesc;

  @JsonKey(name: 'imageurl')
  String? imageurl;

  @JsonKey(name: 'units')
  List<UnitDto>? units;

  UsrCodeDto({this.usrcode,this.description,this.categoryid,this.saleprice,this.shortdesc,this.imageurl,this.units});

  factory UsrCodeDto.fromJson(Map<String,dynamic> json) => _$UsrCodeDtoFromJson(json);
  Map<String,dynamic> toJson() => _$UsrCodeDtoToJson(this);
}
