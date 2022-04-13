import 'package:json_annotation/json_annotation.dart';

part 'sqlexecutiontypes.g.dart';
@JsonEnum(alwaysCreate: true)
enum SqlExecutionTypes
{
  @JsonValue(0)
  ExecuteOnly,

  @JsonValue(1)
  ExecuteOutput,

  @JsonValue(2)
  ExecuteResult
}