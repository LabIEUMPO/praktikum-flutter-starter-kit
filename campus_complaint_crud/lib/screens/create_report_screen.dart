import 'package:flutter/material.dart';
import '../core/themes/app_themes.dart';

class CreateReportScreen extends StatelessWidget {
  const CreateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppThemes.spaceL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Form Laporan Baru', style: AppThemes.pageHeadingStyle),
            const SizedBox(height: AppThemes.spaceXS),
            const Text(
              'Lengkapi detail kerusakan fasilitas kampus agar segera ditindaklanjuti.',
              style: AppThemes.secondaryTextStyle,
            ),
            const SizedBox(height: AppThemes.spaceXL),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppThemes.spaceL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Judul Laporan',
                      style: AppThemes.cardTitleStyle,
                    ),
                    const SizedBox(height: AppThemes.spaceS),
                    const TextField(
                      style: AppThemes.bodyTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Contoh: AC Ruang Kelas D-203 Mati',
                        prefixIcon: Icon(Icons.title),
                      ),
                    ),
                    const SizedBox(height: AppThemes.spaceL),

                    const Text(
                      'Lokasi Kejadian',
                      style: AppThemes.cardTitleStyle,
                    ),
                    const SizedBox(height: AppThemes.spaceS),
                    const TextField(
                      style: AppThemes.bodyTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Contoh: Gedung D Lantai 2, Ruang 203',
                        prefixIcon: Icon(Icons.location_on_outlined),
                      ),
                    ),
                    const SizedBox(height: AppThemes.spaceL),

                    const Text('Nama Pelapor', style: AppThemes.cardTitleStyle),
                    const SizedBox(height: AppThemes.spaceS),
                    const TextField(
                      style: AppThemes.bodyTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama lengkap Anda',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: AppThemes.spaceL),

                    const Text(
                      'Deskripsi Lengkap',
                      style: AppThemes.cardTitleStyle,
                    ),
                    const SizedBox(height: AppThemes.spaceS),
                    const TextField(
                      maxLines: 4,
                      style: AppThemes.bodyTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Jelaskan kondisi kerusakan secara rinci...',
                        alignLabelWithHint: true,
                      ),
                    ),
                    const SizedBox(height: AppThemes.spaceL),

                    const Text(
                      'Foto Bukti (Opsional)',
                      style: AppThemes.cardTitleStyle,
                    ),
                    const SizedBox(height: AppThemes.spaceS),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppThemes.spaceXL,
                        horizontal: AppThemes.spaceL,
                      ),
                      decoration: BoxDecoration(
                        color: AppThemes.background,
                        borderRadius: BorderRadius.circular(
                          AppThemes.radiusImage,
                        ),
                        border: Border.all(color: AppThemes.border, width: 1),
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 32,
                            color: AppThemes.primary,
                          ),
                          SizedBox(height: AppThemes.spaceS),
                          Text(
                            'Ketuk untuk memilih atau mengambil foto',
                            textAlign: TextAlign.center,
                            style: AppThemes.bodyTextStyle,
                          ),
                          SizedBox(height: AppThemes.spaceXS),
                          Text(
                            'Format JPG atau PNG (Maks. 5 MB)',
                            textAlign: TextAlign.center,
                            style: AppThemes.secondaryTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppThemes.spaceXL),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppThemes.primaryText,
                      side: const BorderSide(color: AppThemes.border),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppThemes.spaceM,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppThemes.radiusButton,
                        ),
                      ),
                    ),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: AppThemes.spaceM),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.send_rounded, size: 18),
                    label: const Text('Kirim Laporan'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppThemes.spaceL),
          ],
        ),
      ),
    );
  }
}
