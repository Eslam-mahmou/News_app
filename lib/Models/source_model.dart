import 'package:hive/hive.dart';
part 'source_model.g.dart';
class SourceModel {
  final String status;
  final List<Source> sources;
  String ?code;
  String?message;

  SourceModel({required this.sources,required this.status,this.code,this.message});
  factory SourceModel.fromJson(Map<String,dynamic> json){
    return SourceModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      sources: List.from(json['sources']).map((source){
        return Source.fromJson(source);
      }).toList());
    }
}
@HiveType(typeId: 0)
class Source extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
