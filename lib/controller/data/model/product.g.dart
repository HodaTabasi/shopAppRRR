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
      categoryId: fields[1] as int?,
      subcategoryId: fields[2] as int?,
      productNameEn: fields[3] as String?,
      productNameAr: fields[4] as String?,
      brandEn: fields[5] as String?,
      brandAr: fields[6] as String?,
      productQty: fields[7] as String?,
      productSize: fields[8] as String?,
      basePrice: fields[9] as String?,
      sellingPrice: fields[10] as String?,
      discountPrice: fields[11] as String?,
      descriptionEn: fields[12] as String?,
      descriptionAr: fields[13] as String?,
      productThumbnail: fields[14] as String?,
      trend: fields[15] as int?,
      newProduct: fields[16] as int?,
      offer: fields[17] as int?,
      createdAt: fields[18] as String?,
      updatedAt: fields[19] as String?,
      colors: (fields[20] as List?)?.cast<MyColors>(),
      multiImg: (fields[21] as List?)?.cast<String>(),
    )
      ..selectedColor = fields[22] as String?
      ..selectedSize = fields[23] as String?
      ..selectedQty = fields[24] as int?
      ..itemCartFlag = fields[25] as bool;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.subcategoryId)
      ..writeByte(3)
      ..write(obj.productNameEn)
      ..writeByte(4)
      ..write(obj.productNameAr)
      ..writeByte(5)
      ..write(obj.brandEn)
      ..writeByte(6)
      ..write(obj.brandAr)
      ..writeByte(7)
      ..write(obj.productQty)
      ..writeByte(8)
      ..write(obj.productSize)
      ..writeByte(9)
      ..write(obj.basePrice)
      ..writeByte(10)
      ..write(obj.sellingPrice)
      ..writeByte(11)
      ..write(obj.discountPrice)
      ..writeByte(12)
      ..write(obj.descriptionEn)
      ..writeByte(13)
      ..write(obj.descriptionAr)
      ..writeByte(14)
      ..write(obj.productThumbnail)
      ..writeByte(15)
      ..write(obj.trend)
      ..writeByte(16)
      ..write(obj.newProduct)
      ..writeByte(17)
      ..write(obj.offer)
      ..writeByte(18)
      ..write(obj.createdAt)
      ..writeByte(19)
      ..write(obj.updatedAt)
      ..writeByte(20)
      ..write(obj.colors)
      ..writeByte(21)
      ..write(obj.multiImg)
      ..writeByte(22)
      ..write(obj.selectedColor)
      ..writeByte(23)
      ..write(obj.selectedSize)
      ..writeByte(24)
      ..write(obj.selectedQty)
      ..writeByte(25)
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
