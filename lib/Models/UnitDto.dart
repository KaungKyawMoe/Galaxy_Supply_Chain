
import 'package:json_annotation/json_annotation.dart';

part 'UnitDto.g.dart';
@JsonSerializable()
class UnitDto{

  @JsonKey(name: 'usrcode')
  String? usrcode;

  @JsonKey(name: 'unittype')
  int? unittype;

  @JsonKey(name: 'saleprice')
  double? saleprice;

  @JsonKey(name: 'shortdesc')
  String? shortdesc;

  UnitDto({this.usrcode,this.unittype,this.saleprice,this.shortdesc});

  factory UnitDto.fromJson(Map<String,dynamic> json) => _$UnitDtoFromJson(json);
  Map<String,dynamic> toJson() => _$UnitDtoToJson(this);
}
