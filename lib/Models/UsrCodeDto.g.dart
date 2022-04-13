// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UsrCodeDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsrCodeDto _$UsrCodeDtoFromJson(Map<String, dynamic> json) => UsrCodeDto(
      usrcode: json['usrcode'] as String?,
      description: json['description'] as String?,
      categoryid: json['categoryid'] as int?,
      saleprice: (json['saleprice'] as num?)?.toDouble(),
      shortdesc: json['shortdesc'] as String?,
      imageurl: json['imageurl'] as String?,
      units: (json['units'] as List<dynamic>?)
          ?.map((e) => UnitDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsrCodeDtoToJson(UsrCodeDto instance) =>
    <String, dynamic>{
      'usrcode': instance.usrcode,
      'description': instance.description,
      'categoryid': instance.categoryid,
      'saleprice': instance.saleprice,
      'shortdesc': instance.shortdesc,
      'imageurl': instance.imageurl,
      'units': instance.units,
    };
