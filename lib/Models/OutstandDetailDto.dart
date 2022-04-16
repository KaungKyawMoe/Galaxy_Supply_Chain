import 'package:json_annotation/json_annotation.dart';

part 'OutstandDetailDto.g.dart';

@JsonSerializable()
class OutstandDetailDto {

  @JsonKey(name: 'tranid')
  int? saletranid;

  @JsonKey(name: 'date')
  DateTime? date;

  @JsonKey(name: 'invtype')
  String? invoicetype;

  @JsonKey(name: 'docid')
  String? docid;

  @JsonKey(name: 'curr')
  String? Curr;

  @JsonKey(name: 'amount')
  double? amount;

  OutstandDetailDto({this.saletranid,this.date, this.invoicetype, this.docid, this.Curr ,this.amount});

  factory OutstandDetailDto.fromJson(Map<String, dynamic> json) =>
      _$OutstandDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OutstandDetailDtoToJson(this);

}
