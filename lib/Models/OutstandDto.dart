import 'package:json_annotation/json_annotation.dart';

part 'OutstandDto.g.dart';

@JsonSerializable()
class OutstandDto {
  @JsonKey(name: 'date')
  DateTime? date;

  @JsonKey(name: 'invoicetype')
  String? invoicetype;

  @JsonKey(name: 'docid')
  String? docid;

  @JsonKey(name: 'amount')
  double? amount;

  OutstandDto({this.date, this.invoicetype, this.docid, this.amount});

  factory OutstandDto.fromJson(Map<String, dynamic> json) =>
      _$OutstandDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OutstandDtoToJson(this);
}
