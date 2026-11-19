import 'package:flutter/material.dart';
import '../models/report.dart';
import '../core/themes/app_themes.dart';
import 'status_badge.dart'; // Import widget reusable

class ReportCard extends StatelessWidget {
  final Report report;
  final VoidCallback? onTap;

  const ReportCard({super.key, required this.report, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppThemes.spaceM), // Minimal 12px
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      report.title,
                      style: AppThemes.cardTitleStyle, // 15px Semi Bold
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: AppThemes.spaceS), // 8px
                  StatusBadge(status: report.status), // <-- Panggil di sini
                ],
              ),
              const SizedBox(height: AppThemes.spaceS),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: AppThemes.secondaryText,
                  ),
                  const SizedBox(width: AppThemes.spaceXS),
                  Expanded(
                    child: Text(
                      report.location,
                      style: AppThemes.secondaryTextStyle, // 12px Regular
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              if (report.description != null &&
                  report.description!.isNotEmpty) ...[
                const SizedBox(height: AppThemes.spaceS),
                Text(
                  report.description!,
                  style: AppThemes.bodyTextStyle, // 14px Regular
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
