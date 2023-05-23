// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyColors.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyColorsAdapter extends TypeAdapter<MyColors> {
  @override
  final int typeId = 2;

  @override
  MyColors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyColors(
      id: fields[0] as int?,
      productId: fields[1] as int?,
      color: fields[2] as String?,
      createdAt: fields[3] as String?,
      updatedAt: fields[4] as String?,
    )..isSelected = fields[5] as bool?;
  }

  @override
  void write(BinaryWriter writer, MyColors obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyColorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
