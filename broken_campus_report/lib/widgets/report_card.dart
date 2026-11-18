import 'package:flutter/material.dart';

import '../models/report.dart';
import '../screens/detail_screen.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: Colors.grey[200],
        title: Text(report.title),
        subtitle: Text(report.description!),
        onTap: () {
          // Navigate to the detail screen when a report is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(report: report),
            ),
          );
        },
      ),
    );
  }
}
