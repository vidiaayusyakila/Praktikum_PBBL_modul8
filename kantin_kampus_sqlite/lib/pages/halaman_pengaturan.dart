import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../helpers/pengaturan_helper.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() => _HalamanPengaturanState();
}

class _HalamanPengaturanState extends State<HalamanPengaturan> {
  bool temaGelap = false;
  final controllerNama = TextEditingController();

  @override
  void initState() {
    super.initState();
    _muatPengaturan();
  }

  Future<void> _muatPengaturan() async {
    final gelap = await PengaturanHelper.muatTemaGelap();
    final nama = await PengaturanHelper.muatNamaPelanggan();
    setState(() {
      temaGelap = gelap;
      controllerNama.text = nama;
    });
  }

  Future<void> _resetPengaturan() async {
    await PengaturanHelper.resetSemua();
    if (temaGelap) {
      context.read<ThemeCubit>().toggle();
    }
    setState(() {
      temaGelap = false;
      controllerNama.clear();
    });
  }

  @override
  void dispose() {
    controllerNama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Mode Gelap'),
                const Spacer(),
                Switch(
                  value: temaGelap,
                  onChanged: (nilai) async {
                    setState(() => temaGelap = nilai);
                    await PengaturanHelper.simpanTemaGelap(nilai);
                    context.read<ThemeCubit>().toggle();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controllerNama,
              decoration: const InputDecoration(
                labelText: 'Nama Pelanggan',
                border: OutlineInputBorder(),
              ),
              onChanged: (nilai) async {
                await PengaturanHelper.simpanNamaPelanggan(nilai);
              },
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: _resetPengaturan,
              icon: const Icon(Icons.restore),
              label: const Text('Reset Pengaturan'),
            ),
          ],
        ),
      ),
    );
  }
}
