// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameterhelper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterHelper _$ParameterHelperFromJson(Map<String, dynamic> json) =>
    ParameterHelper(
      PsqlParameterName: json['PsqlParameterName'] as String?,
      PsqlDbTypes:
          $enumDecodeNullable(_$NpgsqlDbTypeEnumMap, json['PsqlDbTypes']),
      PsqlParameterDirection: $enumDecodeNullable(
          _$ParameterDirectionEnumMap, json['PsqlParameterDirection']),
      PsqlParameterValue: json['PsqlParameterValue'],
    );

Map<String, dynamic> _$ParameterHelperToJson(ParameterHelper instance) =>
    <String, dynamic>{
      'PsqlParameterName': instance.PsqlParameterName,
      'PsqlDbTypes': _$NpgsqlDbTypeEnumMap[instance.PsqlDbTypes],
      'PsqlParameterDirection':
          _$ParameterDirectionEnumMap[instance.PsqlParameterDirection],
      'PsqlParameterValue': instance.PsqlParameterValue,
    };

const _$NpgsqlDbTypeEnumMap = {
  NpgsqlDbType.Boolean: 2,
  NpgsqlDbType.Integer: 9,
  NpgsqlDbType.Text: 19,
  NpgsqlDbType.Varchar: 22,
  NpgsqlDbType.Json: 35,
};

const _$ParameterDirectionEnumMap = {
  ParameterDirection.Input: 1,
  ParameterDirection.Output: 2,
  ParameterDirection.InputOutput: 3,
};
