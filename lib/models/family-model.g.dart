// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family-model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyModelAdapter extends TypeAdapter<FamilyModel> {
  @override
  final int typeId = 1;

  @override
  FamilyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FamilyModel(
      name: fields[0] as String,
      age: fields[1] as int,
      degree: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FamilyModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.degree);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
