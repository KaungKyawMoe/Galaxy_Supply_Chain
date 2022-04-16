// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OutstandDetailDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutstandDetailDto _$OutstandDetailDtoFromJson(Map<String, dynamic> json) =>
    OutstandDetailDto(
      saletranid: json['tranid'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoicetype: json['invtype'] as String?,
      docid: json['docid'] as String?,
      Curr: json['curr'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OutstandDetailDtoToJson(OutstandDetailDto instance) =>
    <String, dynamic>{
      'tranid': instance.saletranid,
      'date': instance.date?.toIso8601String(),
      'invtype': instance.invoicetype,
      'docid': instance.docid,
      'curr': instance.Curr,
      'amount': instance.amount,
    };
