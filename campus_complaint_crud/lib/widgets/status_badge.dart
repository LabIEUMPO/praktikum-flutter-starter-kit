import 'package:flutter/material.dart';
import '../core/themes/app_themes.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  Color _getBadgeColor() {
    switch (status.trim().toLowerCase()) {
      case 'resolved':
      case 'selesai':
      case 'done':
      case 'completed':
        return AppThemes.success;

      case 'in progress':
      case 'diproses':
      case 'pending':
      case 'menunggu':
        return AppThemes.warning;

      case 'rejected':
      case 'ditolak':
      case 'open':
      case 'baru':
      case 'urgent':
        return AppThemes.error;

      default:
        return AppThemes.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final badgeColor = _getBadgeColor();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemes.spaceM,
        vertical: AppThemes.spaceXS,
      ),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppThemes.radiusBadge),
        border: Border.all(color: badgeColor.withValues(alpha: 0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppThemes.spaceXS),
          Flexible(
            child: Text(
              status,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppThemes.statusLabelStyle.copyWith(color: badgeColor),
            ),
          ),
        ],
      ),
    );
  }
}
