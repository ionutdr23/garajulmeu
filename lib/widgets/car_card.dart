import 'package:flutter/material.dart';
import 'package:garajulmeu/theme.dart';
import 'package:intl/intl.dart';
import '../models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

Color _toColor(DateTime? expiry, BuildContext context) {
    if (expiry == null) {
      return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4);
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final now = DateTime.now();

    if (expiry.isBefore(now.add(const Duration(days: 15)))) return Theme.of(context).colorScheme.error;
    if (expiry.isBefore(now.add(const Duration(days: 30)))) {
      return isDark ? AppTheme.draculaYellow : AppTheme.lightYellow;
    }
    return isDark ? AppTheme.draculaGreen : AppTheme.lightGreen;
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('dd.MM.yyyy').format(date.toLocal());
  }

  String _daysUntil(DateTime? date) {
    if (date == null) return '';
    final days = date.difference(DateTime.now()).inDays;
    if (days < 0) return '(expirat de ${-days} zile)';
    if (days == 0) return '(expiră azi)';
    return '($days zile rămase)';
  }

  Widget _documentRow(
    BuildContext context,
    String label,
    IconData icon,
    DateTime? expiry,
  ) {
    final color = _toColor(expiry, context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatDate(expiry),
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
              if (expiry != null)
                Text(
                  _daysUntil(expiry),
                  style: TextStyle(
                    color: color.withValues(alpha: 0.7),
                    fontSize: 11,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.directions_car, size: 32),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${car.plate} • ${car.year}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24),
            _documentRow(
              context,
              'RCA',
              Icons.shield_outlined,
              car.insuranceExpiry,
            ),
            _documentRow(
              context,
              'ITP',
              Icons.fact_check_outlined,
              car.itpExpiry,
            ),
            _documentRow(
              context,
              'Rovinietă',
              Icons.receipt_long_outlined,
              car.vignetteExpiry,
            ),
          ],
        ),
      ),
    );
  }
}
