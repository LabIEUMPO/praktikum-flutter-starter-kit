import 'package:flutter/material.dart';
import '../data/sample_reports.dart';
import '../models/report.dart';
import '../widgets/report_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Report> reports = sampleReports;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Reports')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset('assets/images/campus.jpg', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            // List Berdasarkan Index
            ListView.separated(
              itemBuilder: (context, index) {
                return ReportCard(report: reports[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemCount: reports.length,
            ),
          ],
        ),
      ),
    );
  }
}
