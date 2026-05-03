import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';

import '../../providers/auth_provider.dart';
import '../../providers/car_provider.dart';
import '../../providers/user_profile_provider.dart';
import 'add_car_screen.dart';
import '../../widgets/car_card.dart';
import 'car_detail_screen.dart';

class CarsScreen extends ConsumerWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final userProfile = ref.watch(userProfileProvider(user!.uid)).value;
    final familyId = userProfile!.familyId!;
    final cars = ref.watch(carsProvider(familyId));

    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const AddCarScreen())),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
      ),
      body: cars.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(
          child: Text('Nu am putut încărca mașinile. Încearcă din nou.'),
        ),
        data: (carList) {
          if (carList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.directions_car_outlined, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Nu ai adăugat nicio mașină.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Apasă + pentru a adăuga prima mașină.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: carList.length,
            itemBuilder: (context, index) {
              final car = carList[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        CarDetailScreen(car: car, familyId: familyId),
                  ),
                ),
                child: CarCard(car: car),
              );
            },
          );
        },
      ),
    );
  }
}
