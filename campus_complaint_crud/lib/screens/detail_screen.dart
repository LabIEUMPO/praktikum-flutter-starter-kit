import 'package:flutter/material.dart';
import '../models/report.dart';
import '../core/themes/app_themes.dart';
import '../widgets/status_badge.dart';

class DetailScreen extends StatelessWidget {
  final Report report;

  const DetailScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppThemes.spaceL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppThemes.spaceL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusBadge(status: report.status),
                    const SizedBox(height: AppThemes.spaceM),

                    Text(report.title, style: AppThemes.pageHeadingStyle),
                    const Divider(),

                    _buildMetaRow(
                      icon: Icons.location_on_outlined,
                      label: 'Lokasi Kejadian',
                      value: report.location,
                    ),
                    const SizedBox(height: AppThemes.spaceM),

                    _buildMetaRow(
                      icon: Icons.person_outline,
                      label: 'Pelapor',
                      value:
                          (report.reporter != null &&
                              report.reporter!.trim().isNotEmpty)
                          ? report.reporter!
                          : 'Anonim',
                    ),

                    if (_getFormattedDate() != null) ...[
                      const SizedBox(height: AppThemes.spaceM),
                      _buildMetaRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Tanggal Laporan',
                        value: _getFormattedDate()!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppThemes.spaceXL),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppThemes.spaceL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi Laporan',
                      style: AppThemes.sectionHeadingStyle,
                    ),
                    const SizedBox(height: AppThemes.spaceM),
                    Text(
                      (report.description != null &&
                              report.description!.trim().isNotEmpty)
                          ? report.description!
                          : 'Tidak ada deskripsi tambahan untuk laporan ini.',
                      style: AppThemes.bodyTextStyle.copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppThemes.primary),
        const SizedBox(width: AppThemes.spaceM),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppThemes.secondaryTextStyle),
              const SizedBox(height: AppThemes.spaceXS),
              Text(
                value,
                style: AppThemes.bodyTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String? _getFormattedDate() {
    try {
      final dynamic dynamicReport = report;
      final dateValue = dynamicReport.date;
      if (dateValue != null && dateValue.toString().trim().isNotEmpty) {
        return dateValue.toString();
      }
    } catch (_) {}
    return null;
  }
}
