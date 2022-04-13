
// ignore_for_file: constant_identifier_names
import 'package:flutter_app/Common/parameterhelper.dart';
import 'package:json_annotation/json_annotation.dart';
import 'sqlexecutiontypes.dart';

part 'apihelper.g.dart';
@JsonSerializable()
class ApiHelper{

  @JsonKey(name: 'isstoredprocedure')
  late bool? IsStoredProcedure;

  @JsonKey(name: 'sqlquery')
  late String? SqlQuery;

  @JsonKey(name: 'storedprocedurename')
  late String? StoredProcedureName;

  @JsonKey(name: 'parameters')
  late List<List<ParameterHelper>>? Parameters;

  @JsonKey(name: 'sqlexecutiontype')
  late SqlExecutionTypes? SqlExecutionType;

  ApiHelper({this.IsStoredProcedure,this.SqlQuery,this.StoredProcedureName,this.Parameters,this.SqlExecutionType});

  Map<String,dynamic> toJson() => _$ApiHelperToJson(this);

}
