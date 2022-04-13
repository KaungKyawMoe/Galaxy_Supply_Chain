import 'package:json_annotation/json_annotation.dart';
part 'npgsqldbtype.g.dart';
@JsonEnum(alwaysCreate: true)
enum NpgsqlDbType
{
  @JsonValue(2)
  Boolean,

  @JsonValue(9)
  Integer,

  @JsonValue(19)
  Text,

  @JsonValue(22)
  Varchar,

  @JsonValue(35)
  Json
}