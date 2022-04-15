import 'package:json_annotation/json_annotation.dart';

part 'CategoryDto.g.dart';

@JsonSerializable()
class CategoryDto {
  @JsonKey(name: 'categoryid')
  int? categoryid;

  @JsonKey(name: 'name')
  String? name;

  CategoryDto({this.categoryid, this.name});

  factory CategoryDto.fromJson(Map<String,dynamic> json) => _$CategoryDtoFromJson(json);
  Map<String,dynamic> toJson() => _$CategoryDtoToJson(this);

}
