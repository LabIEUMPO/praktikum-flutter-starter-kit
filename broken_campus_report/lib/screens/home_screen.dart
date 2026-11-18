import 'package:flutter/material.dart';
import 'package:broken_campus_report/data/sample_reports.dart';
import 'package:broken_campus_report/models/report.dart';
import '../widgets/report_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Report> reports = sampleReports;

  List<Report> _filterReports = [];

  void _runFilter(String enteredKeyword) {
    List<Report> results = [];
    if (enteredKeyword.isEmpty) {
      results = reports;
    } else {
      results = reports
          .where(
            (report) =>
                report.title.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ) ||
                report.description!.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      _filterReports = results;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Reports')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                hintText: 'Search reports...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filterReports.isNotEmpty
                    ? _filterReports.length
                    : reports.length,
                itemBuilder: (context, index) {
                  final report = _filterReports.isNotEmpty
                      ? _filterReports[index]
                      : reports[index];
                  return ReportCard(report: report);
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset('assets/images/campus.jpg', fit: BoxFit.cover),
            ),
            //
            SizedBox(height: 10),
            ReportCard(report: reports[1]),
            ReportCard(report: reports[2]),
            ReportCard(report: reports[3]),
            ReportCard(report: reports[4]),
            ReportCard(report: reports[5]),
            ReportCard(report: reports[0]),
          ],
        ),
      ),
    );
  }
}
