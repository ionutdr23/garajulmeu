import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cars/cars_screen.dart';

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

  static const _screens = [
    CarsScreen(),
    Placeholder(), // Mentenanță - pentru acum
    Placeholder(), // Setări - pentru acum
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) =>
            ref.read(bottomNavIndexProvider.notifier).setIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Mașini',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Mentenanță'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setări'),
        ],
      ),
    );
  }
}
