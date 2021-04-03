import 'dart:convert';
import 'package:hive/hive.dart';
part 'family-model.g.dart';

FamilyModel familyModelFromJson(String str) =>
    FamilyModel.fromJson(json.decode(str));

String familyModelToJson(FamilyModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class FamilyModel {
  FamilyModel({
    this.name,
    this.age,
    this.degree,
  });
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  String degree;

  factory FamilyModel.fromJson(Map<String, dynamic> json) => FamilyModel(
        name: json["name"],
        age: json["age"],
        degree: json["degree"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "degree": degree,
      };
}
