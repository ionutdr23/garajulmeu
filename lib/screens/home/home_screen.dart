import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/screens/settings/settings_screen.dart';

import '../cars/cars_screen.dart';
import '../maintenance/maintenance_screen.dart';

final bottomNavIndexProvider = NotifierProvider<BottomNavNotifier, int>(
  BottomNavNotifier.new,
);

class BottomNavNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _screens = [CarsScreen(), MaintenanceScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) =>
            ref.read(bottomNavIndexProvider.notifier).setIndex(index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.directions_car),
            label: 'Mașini',
          ),
          NavigationDestination(icon: Icon(Icons.build), label: 'Mentenanță'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Setări'),
        ],
      ),
    );
  }
}
