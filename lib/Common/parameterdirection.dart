import 'package:json_annotation/json_annotation.dart';
part 'parameterdirection.g.dart';
@JsonEnum(alwaysCreate: true)
enum ParameterDirection
{
  @JsonValue(1)
  Input,

  @JsonValue(2)
  Output,

  @JsonValue(3)
  InputOutput
}