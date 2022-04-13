import 'package:json_annotation/json_annotation.dart';
import 'npgsqldbtype.dart';
import 'parameterdirection.dart';
part 'parameterhelper.g.dart';

@JsonSerializable()
class ParameterHelper
{
  @JsonKey(name: 'PsqlParameterName')
  String? PsqlParameterName ;

  @JsonKey(name: 'PsqlDbTypes')
  NpgsqlDbType? PsqlDbTypes;

  @JsonKey(name: 'PsqlParameterDirection')
  ParameterDirection? PsqlParameterDirection;

  @JsonKey(name: 'PsqlParameterValue')
  dynamic PsqlParameterValue;

  ParameterHelper({this.PsqlParameterName,this.PsqlDbTypes,this.PsqlParameterDirection,this.PsqlParameterValue});

  factory ParameterHelper.fromJson(Map<String,dynamic> json) => _$ParameterHelperFromJson(json);
  Map<String,dynamic> toJson() => _$ParameterHelperToJson(this);
}