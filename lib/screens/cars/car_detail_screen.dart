import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/providers/maintenance_provider.dart';
import 'package:garajulmeu/screens/cars/edit_car_screen.dart';
import 'package:garajulmeu/screens/maintenance/add_maintenance_screen.dart';
import 'package:garajulmeu/screens/maintenance/maintenance_detail_screen.dart';
import 'package:garajulmeu/widgets/maintenance_card.dart';
import 'package:intl/intl.dart';
import 'package:garajulmeu/theme.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';
import 'package:garajulmeu/models/car.dart';
import 'package:garajulmeu/providers/car_provider.dart';
import 'package:garajulmeu/widgets/app_button.dart';

class CarDetailScreen extends ConsumerWidget {
  final Car car;
  final String familyId;

  const CarDetailScreen({super.key, required this.car, required this.familyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carsAsync = ref.watch(carsProvider(familyId));
    final currentCar =
        carsAsync
            .whenData(
              (cars) =>
                  cars.firstWhere((c) => c.id == car.id, orElse: () => car),
            )
            .value ??
        car;

    return AppScaffold(
      title: currentCar.name,
      bottomWidget: SizedBox(
        width: double.infinity,
        child: AppButton(
          text: 'Șterge mașina',
          type: AppButtonType.destructive,
          icon: const Icon(Icons.delete_outline, color: Colors.white),
          onPressed: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Confirmare ștergere'),
                content: const Text(
                  'Ești sigur că vrei să ștergi această mașină? Această acțiune nu poate fi anulată.',
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
                  .read(carServiceProvider)
                  .deleteCar(familyId, currentCar);
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
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => EditCarScreen(car: currentCar),
                ),
              ),
              child: _CarHeader(car: currentCar),
            ),
            const SizedBox(height: 24),
            _SectionTitle(title: 'Documente'),
            const SizedBox(height: 8),
            _DocumentTile(
              label: 'RCA',
              icon: Icons.shield_outlined,
              expiry: currentCar.insuranceExpiry,
              onEdit: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: currentCar.insuranceExpiry ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
                );
                if (picked != null) {
                  final updated = currentCar.copyWith(insuranceExpiry: picked);
                  await ref
                      .read(carServiceProvider)
                      .updateCar(familyId, updated);
                }
              },
            ),
            _DocumentTile(
              label: 'ITP',
              icon: Icons.fact_check_outlined,
              expiry: currentCar.itpExpiry,
              onEdit: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: currentCar.itpExpiry ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
                );
                if (picked != null) {
                  final updated = currentCar.copyWith(itpExpiry: picked);
                  await ref
                      .read(carServiceProvider)
                      .updateCar(familyId, updated);
                }
              },
            ),
            _DocumentTile(
              label: 'Rovinieta',
              icon: Icons.receipt_long_outlined,
              expiry: currentCar.vignetteExpiry,
              onEdit: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: currentCar.vignetteExpiry ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
                );
                if (picked != null) {
                  final updated = currentCar.copyWith(vignetteExpiry: picked);
                  await ref
                      .read(carServiceProvider)
                      .updateCar(familyId, updated);
                }
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SectionTitle(title: 'Mentenanță'),
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AddMaintenanceScreen(
                        carId: currentCar.id,
                        familyId: familyId,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _MaintenanceList(familyId: familyId, carId: currentCar.id),
          ],
        ),
      ),
    );
  }
}

class _CarHeader extends StatelessWidget {
  final Car car;

  const _CarHeader({required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.directions_car, size: 48),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(car.plate, style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    'An fabricație: ${car.year}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
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
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final DateTime? expiry;
  final VoidCallback onEdit;

  const _DocumentTile({
    required this.label,
    required this.icon,
    required this.expiry,
    required this.onEdit,
  });

  Color _toColor(BuildContext context) {
    if (expiry == null) {
      return Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4);
    }
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final now = DateTime.now();
    if (expiry!.isBefore(now.add(const Duration(days: 15)))) {
      return Theme.of(context).colorScheme.error;
    }
    if (expiry!.isBefore(now.add(const Duration(days: 30)))) {
      return isDark ? AppTheme.draculaYellow : AppTheme.lightYellow;
    }
    return isDark ? AppTheme.draculaGreen : AppTheme.lightGreen;
  }

  String _formatDate() {
    if (expiry == null) return 'Necompletat';
    return DateFormat('dd.MM.yyyy').format(expiry!.toLocal());
  }

  String _daysUntil() {
    if (expiry == null) return '';
    final days = expiry!.difference(DateTime.now()).inDays;
    if (days < 0) return 'Expirat de ${-days} zile';
    if (days == 0) return 'Expiră azi';
    return '$days zile rămase';
  }

  @override
  Widget build(BuildContext context) {
    final color = _toColor(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label),
        subtitle: expiry != null
            ? Text(_daysUntil(), style: TextStyle(color: color, fontSize: 12))
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formatDate(),
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
          ],
        ),
      ),
    );
  }
}

class _MaintenanceList extends ConsumerWidget {
  final String familyId;
  final String carId;

  const _MaintenanceList({required this.familyId, required this.carId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maintenanceAsync = ref.watch(maintenanceProvider((familyId, carId)));

    return maintenanceAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Text('Eroare la încărcarea mentenanței.'),
      data: (records) {
        if (records.isEmpty) {
          return const Center(
            child: Text('Nu există înregistrări de mentenanță.'),
          );
        }
        return Column(
          children: records
              .map(
                (m) => GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => MaintenanceDetailScreen(
                        familyId: familyId,
                        carId: carId,
                        maintenance: m,
                      ),
                    ),
                  ),
                  child: MaintenanceCard(
                    maintenance: m,
                    familyId: familyId,
                    carId: carId,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
