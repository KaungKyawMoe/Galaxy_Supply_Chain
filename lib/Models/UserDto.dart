
import 'package:json_annotation/json_annotation.dart';

part 'UserDto.g.dart';

@JsonSerializable()
class UserDto{

  @JsonKey(name:'userid')
  int? userid;

  @JsonKey(name:'password')
  String? password;

  @JsonKey(name:'shortdesc')
  String? shortdesc;

  @JsonKey(name:'name')
  String? name;

  @JsonKey(name:'isinactive')
  bool? isinactive;

  UserDto({
    this.userid, this.password, this.shortdesc, this.name, this.isinactive
  });

  factory UserDto.fromJson(Map<String,dynamic> json) => _$UserDtoFromJson(json);
  Map<String,dynamic> toJson() => _$UserDtoToJson(this);
}