// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnitDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitDto _$UnitDtoFromJson(Map<String, dynamic> json) => UnitDto(
      usrcode: json['usrcode'] as String?,
      unittype: json['unittype'] as int?,
      saleprice: (json['saleprice'] as num?)?.toDouble(),
      shortdesc: json['shortdesc'] as String?,
    );

Map<String, dynamic> _$UnitDtoToJson(UnitDto instance) => <String, dynamic>{
      'usrcode': instance.usrcode,
      'unittype': instance.unittype,
      'saleprice': instance.saleprice,
      'shortdesc': instance.shortdesc,
    };
