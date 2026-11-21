import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../helpers/hive_helper.dart';
import '../models/produk_favorit.dart';

class HalamanFavorit extends StatelessWidget {
  const HalamanFavorit({super.key});

  Future<void> ubahCatatan(ProdukFavorit favorit, String catatanBaru) async {
    favorit.catatan = catatanBaru;
    await favorit.save();
  }

  Future<void> _tampilkanDialogUbah(BuildContext context, ProdukFavorit favorit) async {
    final controller = TextEditingController(text: favorit.catatan);
    final catatanBaru = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ubah Catatan'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Catatan pribadi'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
    if (catatanBaru != null) {
      await ubahCatatan(favorit, catatanBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produk Favorit')),
      body: ValueListenableBuilder(
        valueListenable: HiveHelper.box.listenable(),
        builder: (context, box, _) {
          final daftarFavorit = box.values.toList();
          if (daftarFavorit.isEmpty) {
            return const Center(child: Text('Belum ada produk favorit'));
          }
          return ListView.builder(
            itemCount: daftarFavorit.length,
            itemBuilder: (context, index) {
              final favorit = daftarFavorit[index];
              return Dismissible(
                key: ValueKey(favorit.idProduk),
                direction: DismissDirection.endToStart,
                onDismissed: (_) async {
                  await favorit.delete();
                },
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(favorit.nama),
                  subtitle: Text('Rp${favorit.harga}  •  ${favorit.catatan}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _tampilkanDialogUbah(context, favorit),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
