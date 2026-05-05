import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/models/maintenance.dart';
import 'package:garajulmeu/providers/maintenance_provider.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';
import 'package:garajulmeu/widgets/app_button.dart';
import 'package:intl/intl.dart';

class MaintenanceDetailScreen extends ConsumerWidget {
  final String familyId;
  final String carId;
  final Maintenance maintenance;

  const MaintenanceDetailScreen({
    super.key,
    required this.familyId,
    required this.carId,
    required this.maintenance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maintenancesAsync = ref.watch(maintenanceProvider((familyId, carId)));
    final currentMaintenance =
        maintenancesAsync
            .whenData(
              (maintenances) => maintenances.firstWhere(
                (m) => m.id == maintenance.id,
                orElse: () => maintenance,
              ),
            )
            .value ??
        maintenance;

    return AppScaffold(
      title: currentMaintenance.type,
      bottomWidget: SizedBox(
        width: double.infinity,
        child: AppButton(
          text: 'Șterge mentenanța',
          type: AppButtonType.destructive,
          icon: const Icon(Icons.delete_outline, color: Colors.white),
          onPressed: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Confirmare ștergere'),
                content: const Text(
                  'Ești sigur că vrei să ștergi această mentenanță? Această acțiune nu poate fi anulată.',
                ),
                actions: [
                  AppButton(
                    text: 'Anulează',
                    type: AppButtonType.secondary,
                    icon: const Icon(Icons.close_outlined),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  AppButton(
                    text: 'Șterge',
                    type: AppButtonType.destructive,
                    icon: const Icon(Icons.delete_outline, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
            if (confirmed == true) {
              await ref
                  .read(maintenanceServiceProvider)
                  .deleteMaintenance(familyId, carId, currentMaintenance);
              if (!context.mounted) return;
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _DetailRow(
                      icon: Icons.build_outlined,
                      label: 'Tip',
                      value: currentMaintenance.type,
                    ),
                    _DetailRow(
                      icon: Icons.calendar_today,
                      label: 'Data',
                      value: DateFormat(
                        'dd.MM.yyyy',
                      ).format(currentMaintenance.date.toLocal()),
                    ),
                    _DetailRow(
                      icon: Icons.speed,
                      label: 'Kilometraj',
                      value: '${currentMaintenance.mileage} km',
                    ),
                    if (currentMaintenance.notes != null)
                      _DetailRow(
                        icon: Icons.notes,
                        label: 'Note',
                        value: currentMaintenance.notes!,
                      ),
                    if (currentMaintenance.nextDate != null)
                      _DetailRow(
                        icon: Icons.event,
                        label: 'Data următoare',
                        value: DateFormat(
                          'dd.MM.yyyy',
                        ).format(currentMaintenance.nextDate!.toLocal()),
                      ),
                    if (currentMaintenance.nextMileage != null)
                      _DetailRow(
                        icon: Icons.speed_outlined,
                        label: 'Km următori',
                        value: '${currentMaintenance.nextMileage} km',
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
