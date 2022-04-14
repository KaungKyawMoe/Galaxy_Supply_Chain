// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      userid: json['userid'] as int?,
      password: json['password'] as String?,
      shortdesc: json['shortdesc'] as String?,
      name: json['name'] as String?,
      isinactive: json['isinactive'] as bool?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'userid': instance.userid,
      'password': instance.password,
      'shortdesc': instance.shortdesc,
      'name': instance.name,
      'isinactive': instance.isinactive,
    };
