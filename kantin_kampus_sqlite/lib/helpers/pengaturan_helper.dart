import 'package:shared_preferences/shared_preferences.dart';

class PengaturanHelper {
  PengaturanHelper._();
  static const String kunciTemaGelap = 'tema_gelap';
  static const String kunciNamaPelanggan = 'nama_pelanggan';

  static Future<bool> muatTemaGelap() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kunciTemaGelap) ?? false;
  }

  static Future<void> simpanTemaGelap(bool aktif) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kunciTemaGelap, aktif);
  }

  static Future<String> muatNamaPelanggan() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(kunciNamaPelanggan) ?? '';
  }

  static Future<void> simpanNamaPelanggan(String nama) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kunciNamaPelanggan, nama);
  }

  static Future<void> resetSemua() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(kunciTemaGelap);
    await prefs.remove(kunciNamaPelanggan);
  }
}
