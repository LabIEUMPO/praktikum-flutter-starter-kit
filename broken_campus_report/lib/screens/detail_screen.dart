import 'package:broken_campus_report/models/report.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Report report;

  const DetailScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(report.title),
            Text(report.location),
            Text(report.description!),
            Text(report.status),
            Text(report.reporter!),
          ],
        ),
      ),
    );
  }
}
