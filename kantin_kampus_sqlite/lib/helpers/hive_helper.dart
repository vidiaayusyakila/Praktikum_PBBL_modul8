import 'package:hive_flutter/hive_flutter.dart';
import '../models/produk_favorit.dart';

class HiveHelper {
  HiveHelper._();
  static const String namaBoxFavorit = 'favoritBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProdukFavoritAdapter());
    await Hive.openBox<ProdukFavorit>(namaBoxFavorit);
  }

  static Box<ProdukFavorit> get box =>
      Hive.box<ProdukFavorit>(namaBoxFavorit);
}
