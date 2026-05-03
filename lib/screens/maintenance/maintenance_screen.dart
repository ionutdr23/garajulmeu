import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';
import 'package:garajulmeu/providers/auth_provider.dart';
import 'package:garajulmeu/providers/user_profile_provider.dart';

class MaintenanceScreen extends ConsumerWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final userProfile = ref.watch(userProfileProvider(user!.uid)).value;
    final familyId = userProfile!.familyId!;

    return AppScaffold(
      body: const Center(child: Text('Screen de mentenanță')),
    );
  }
}
