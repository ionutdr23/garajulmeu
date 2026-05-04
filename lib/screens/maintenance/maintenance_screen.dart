import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/models/car.dart';
import 'package:garajulmeu/models/maintenance.dart';
import 'package:garajulmeu/providers/maintenance_provider.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';
import 'package:garajulmeu/providers/auth_provider.dart';
import 'package:garajulmeu/providers/user_profile_provider.dart';
import 'package:garajulmeu/widgets/maintenance_card.dart';
import 'package:intl/intl.dart';

class MaintenanceScreen extends ConsumerWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final userProfile = ref.watch(userProfileProvider(user!.uid)).value;
    final familyId = userProfile!.familyId!;
    final allMaintenanceAsync = ref.watch(allMaintenanceProvider(familyId));

    return AppScaffold(
      body: allMaintenanceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(
          child: Text('Nu am putut încărca înregistrările. Încearcă din nou.'),
        ),
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.build_outlined, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Nu există înregistrări de mentenanță.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Adaugă o înregistrare din pagina mașinii.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          }

          final now = DateTime.now();
          final upcoming =
              records
                  .where(
                    (r) => r.$1.nextDate != null && r.$1.nextDate!.isAfter(now),
                  )
                  .toList()
                ..sort((a, b) => a.$1.nextDate!.compareTo(b.$1.nextDate!));

          final history = records.toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _StatsCard(records: records),
              const SizedBox(height: 24),

              if (upcoming.isNotEmpty) ...[
                _SectionTitle(title: 'Programată'),
                const SizedBox(height: 8),
                ...upcoming.map(
                  (r) => MaintenanceCard(
                    maintenance: r.$1,
                    familyId: familyId,
                    carId: r.$2.id,
                    car: r.$2,
                    showUpcoming: true,
                  ),
                ),
                const SizedBox(height: 24),
              ],

              _SectionTitle(title: 'Istoric'),
              const SizedBox(height: 8),
              ...history.map(
                (r) => MaintenanceCard(
                  maintenance: r.$1,
                  familyId: familyId,
                  carId: r.$2.id,
                  car: r.$2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final List<(Maintenance, Car)> records;

  const _StatsCard({required this.records});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final thisMonth = records
        .where(
          (r) => r.$1.date.month == now.month && r.$1.date.year == now.year,
        )
        .length;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.bar_chart, size: 36),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$thisMonth efectuat${thisMonth == 1 ? 'ă' : 'e'} în ${DateFormat('MMMM yyyy', 'ro').format(now)}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${records.length} total',
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
