import 'package:flutter/material.dart';
import '../core/themes/app_themes.dart';
import '../data/sample_reports.dart';
import '../models/report.dart';
import '../widgets/report_card.dart';
import 'create_report_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Report> reports = sampleReports;

  List<Report> _filterReports = [];
  String _searchQuery = '';

  void _runFilter(String enteredKeyword) {
    final keyword = enteredKeyword.trim().toLowerCase();

    setState(() {
      _searchQuery = keyword;

      if (keyword.isEmpty) {
        _filterReports = [];
      } else {
        _filterReports = reports.where((report) {
          final titleMatch = report.title.toLowerCase().contains(keyword);
          final descMatch = (report.description ?? '').toLowerCase().contains(
            keyword,
          );
          return titleMatch || descMatch;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Reports')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppThemes.spaceL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Campus Reports', style: AppThemes.pageHeadingStyle),
            const SizedBox(height: AppThemes.spaceXS),
            const Text(
              'Pantau dan laporkan kerusakan fasilitas di lingkungan kampus.',
              style: AppThemes.secondaryTextStyle,
            ),
            const SizedBox(height: AppThemes.spaceL),

            TextField(
              onChanged: _runFilter,
              style: AppThemes.bodyTextStyle,
              decoration: const InputDecoration(
                hintText: 'Search reports...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: AppThemes.spaceXL),

            if (_searchQuery.isNotEmpty) ...[
              if (_filterReports.isNotEmpty) ...[
                const Text(
                  'Search Results',
                  style: AppThemes.sectionHeadingStyle,
                ),
                const SizedBox(height: AppThemes.spaceM),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filterReports.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppThemes.spaceM),
                  itemBuilder: (context, index) {
                    return ReportCard(report: _filterReports[index]);
                  },
                ),
              ] else ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppThemes.spaceL),
                  decoration: BoxDecoration(
                    color: AppThemes.surface,
                    borderRadius: BorderRadius.circular(AppThemes.radiusCard),
                    border: Border.all(color: AppThemes.border),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.search_off,
                        color: AppThemes.secondaryText,
                        size: 32,
                      ),
                      SizedBox(height: AppThemes.spaceS),
                      Text(
                        'No matching reports found.',
                        style: AppThemes.bodyTextStyle,
                      ),
                      SizedBox(height: AppThemes.spaceXS),
                      Text(
                        'Coba gunakan kata kunci lain.',
                        style: AppThemes.secondaryTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
              const Divider(),
            ],

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppThemes.radiusImage),
                side: const BorderSide(color: AppThemes.border),
              ),
              child: Image.asset(
                'assets/images/campus.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: AppThemes.spaceXL),

            const Text('All Reports', style: AppThemes.sectionHeadingStyle),
            const SizedBox(height: AppThemes.spaceM),
            if (reports.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppThemes.spaceXL),
                decoration: BoxDecoration(
                  color: AppThemes.surface,
                  borderRadius: BorderRadius.circular(AppThemes.radiusCard),
                  border: Border.all(color: AppThemes.border),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      color: AppThemes.secondaryText,
                      size: 40,
                    ),
                    SizedBox(height: AppThemes.spaceS),
                    Text(
                      'Belum ada laporan tersedia',
                      style: AppThemes.sectionHeadingStyle,
                    ),
                    SizedBox(height: AppThemes.spaceXS),
                    Text(
                      'Daftar laporan kerusakan fasilitas kampus akan muncul di sini.',
                      textAlign: TextAlign.center,
                      style: AppThemes.secondaryTextStyle,
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reports.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(height: AppThemes.spaceM),
                itemBuilder: (context, index) {
                  return ReportCard(
                    report: reports[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(report: reports[index]),
                        ),
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateReportScreen()),
          );
        },
        backgroundColor: AppThemes.primary,
        foregroundColor: AppThemes.surface,
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}
