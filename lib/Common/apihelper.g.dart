// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apihelper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiHelper _$ApiHelperFromJson(Map<String, dynamic> json) => ApiHelper(
      IsStoredProcedure: json['isstoredprocedure'] as bool?,
      SqlQuery: json['sqlquery'] as String?,
      StoredProcedureName: json['storedprocedurename'] as String?,
      Parameters: (json['parameters'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => ParameterHelper.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      SqlExecutionType: $enumDecodeNullable(
          _$SqlExecutionTypesEnumMap, json['sqlexecutiontype']),
    );

Map<String, dynamic> _$ApiHelperToJson(ApiHelper instance) => <String, dynamic>{
      'isstoredprocedure': instance.IsStoredProcedure,
      'sqlquery': instance.SqlQuery,
      'storedprocedurename': instance.StoredProcedureName,
      'parameters': instance.Parameters,
      'sqlexecutiontype': _$SqlExecutionTypesEnumMap[instance.SqlExecutionType],
    };

const _$SqlExecutionTypesEnumMap = {
  SqlExecutionTypes.ExecuteOnly: 0,
  SqlExecutionTypes.ExecuteOutput: 1,
  SqlExecutionTypes.ExecuteResult: 2,
};
