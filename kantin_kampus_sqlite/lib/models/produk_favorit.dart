import 'package:hive/hive.dart';
part 'produk_favorit.g.dart';

@HiveType(typeId: 0)
class ProdukFavorit extends HiveObject {
  @HiveField(0)
  late String idProduk;

  @HiveField(1)
  late String nama;

  @HiveField(2)
  late int harga;

  @HiveField(3)
  String catatan = '';

  ProdukFavorit({
    required this.idProduk,
    required this.nama,
    required this.harga,
    this.catatan = '',
  });
}
