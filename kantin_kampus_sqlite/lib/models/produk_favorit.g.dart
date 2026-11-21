// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produk_favorit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProdukFavoritAdapter extends TypeAdapter<ProdukFavorit> {
  @override
  final int typeId = 0;

  @override
  ProdukFavorit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProdukFavorit(
      idProduk: fields[0] as String,
      nama: fields[1] as String,
      harga: fields[2] as int,
      catatan: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProdukFavorit obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idProduk)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.harga)
      ..writeByte(3)
      ..write(obj.catatan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdukFavoritAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
