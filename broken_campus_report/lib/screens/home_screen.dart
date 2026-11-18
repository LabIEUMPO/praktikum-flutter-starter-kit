import 'package:flutter/material.dart';
import 'package:broken_campus_report/data/sample_reports.dart';
import 'package:broken_campus_report/models/report.dart';
import '../widgets/report_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Report> reports = sampleReports;

  // 1. Awalnya kosong
  List<Report> _filterReports = [];
  String _searchQuery = '';

  void _runFilter(String enteredKeyword) {
    final keyword = enteredKeyword.trim().toLowerCase();

    setState(() {
      if (keyword.isEmpty) {
        // Jika input dikosongkan, hasil pencarian kembali kosong
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              onChanged: _runFilter,
              decoration: InputDecoration(
                hintText: 'Search reports...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tampilkan hasil pencarian jika ada query
                if (_searchQuery.isNotEmpty) ...[
                  if (_filterReports.isNotEmpty) ...[
                    const Text(
                      'Search Results',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._filterReports.map(
                      (report) => ReportCard(report: report),
                    ),
                  ] else ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'No matching reports found.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                  const Divider(height: 24),
                ],
                // Gambar Kampus
                Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'assets/images/campus.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                // List Berdasarkan Index
                ReportCard(report: reports[1]),
                ReportCard(report: reports[2]),
                ReportCard(report: reports[3]),
                ReportCard(report: reports[4]),
                ReportCard(report: reports[5]),
                ReportCard(report: reports[6]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
