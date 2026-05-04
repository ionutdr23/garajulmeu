import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:garajulmeu/models/maintenance.dart';
import 'package:garajulmeu/models/car.dart';
import 'package:garajulmeu/screens/maintenance/maintenance_detail_screen.dart';

class MaintenanceCard extends StatelessWidget {
  final Maintenance maintenance;
  final String familyId;
  final String carId;
  final Car? car;
  final bool showUpcoming;

  const MaintenanceCard({
    super.key,
    required this.maintenance,
    required this.familyId,
    required this.carId,
    this.car,
    this.showUpcoming = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MaintenanceDetailScreen(
            familyId: familyId,
            carId: carId,
            maintenance: maintenance,
          ),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.build_outlined, size: 36),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maintenance.type,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (car != null)
                      Text(
                        car!.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    Text(
                      showUpcoming && maintenance.nextDate != null
                          ? '${maintenance.nextMileage} km'
                          : '${maintenance.mileage} km',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd.MM.yyyy').format(
                      showUpcoming && maintenance.nextDate != null
                          ? maintenance.nextDate!.toLocal()
                          : maintenance.date.toLocal(),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
