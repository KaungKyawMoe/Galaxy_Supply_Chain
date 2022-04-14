// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OutstandDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutstandDto _$OutstandDtoFromJson(Map<String, dynamic> json) => OutstandDto(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoicetype: json['invoicetype'] as String?,
      docid: json['docid'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OutstandDtoToJson(OutstandDto instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'invoicetype': instance.invoicetype,
      'docid': instance.docid,
      'amount': instance.amount,
    };
