// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OutstandDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutstandDto _$OutstandDtoFromJson(Map<String, dynamic> json) => OutstandDto(
      saletranid: json['tranid'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoicetype: json['invoicetype'] as String?,
      docid: json['docid'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OutstandDtoToJson(OutstandDto instance) =>
    <String, dynamic>{
      'tranid': instance.saletranid,
      'date': instance.date?.toIso8601String(),
      'invoicetype': instance.invoicetype,
      'docid': instance.docid,
      'amount': instance.amount,
    };
