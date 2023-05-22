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
      productQty: fields[5] as String?,
      productSize: fields[6] as String?,
      basePrice: fields[7] as String?,
      sellingPrice: fields[8] as String?,
      discountPrice: fields[9] as String?,
      descriptionEn: fields[10] as String?,
      descriptionAr: fields[11] as String?,
      productThumbnail: fields[12] as String?,
      trend: fields[13] as int?,
      newProduct: fields[14] as int?,
      offer: fields[15] as int?,
    )
      ..selectedColor = fields[16] as String?
      ..selectedSize = fields[17] as String?
      ..selectedQty = fields[18] as int?
      ..itemCartFlag = fields[19] as bool;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(20)
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
      ..write(obj.productQty)
      ..writeByte(6)
      ..write(obj.productSize)
      ..writeByte(7)
      ..write(obj.basePrice)
      ..writeByte(8)
      ..write(obj.sellingPrice)
      ..writeByte(9)
      ..write(obj.discountPrice)
      ..writeByte(10)
      ..write(obj.descriptionEn)
      ..writeByte(11)
      ..write(obj.descriptionAr)
      ..writeByte(12)
      ..write(obj.productThumbnail)
      ..writeByte(13)
      ..write(obj.trend)
      ..writeByte(14)
      ..write(obj.newProduct)
      ..writeByte(15)
      ..write(obj.offer)
      ..writeByte(16)
      ..write(obj.selectedColor)
      ..writeByte(17)
      ..write(obj.selectedSize)
      ..writeByte(18)
      ..write(obj.selectedQty)
      ..writeByte(19)
      ..write(obj.itemCartFlag);
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
