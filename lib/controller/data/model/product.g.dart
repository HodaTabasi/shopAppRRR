// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int?,
      productNameEn: fields[1] as String?,
      productNameAr: fields[2] as String?,
      brandEn: fields[3] as String?,
      brandAr: fields[4] as String?,
      basePrice: fields[5] as String?,
      discountPrice: fields[11] as String?,
      productThumbnail: fields[6] as String?,
      trend: fields[7] as int?,
      newProduct: fields[8] as int?,
      offer: fields[9] as int?,
      status: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productNameEn)
      ..writeByte(2)
      ..write(obj.productNameAr)
      ..writeByte(3)
      ..write(obj.brandEn)
      ..writeByte(4)
      ..write(obj.brandAr)
      ..writeByte(5)
      ..write(obj.basePrice)
      ..writeByte(11)
      ..write(obj.discountPrice)
      ..writeByte(6)
      ..write(obj.productThumbnail)
      ..writeByte(7)
      ..write(obj.trend)
      ..writeByte(8)
      ..write(obj.newProduct)
      ..writeByte(9)
      ..write(obj.offer)
      ..writeByte(10)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
