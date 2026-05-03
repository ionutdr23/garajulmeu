import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/widgets/app_button.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';

import '../../providers/auth_provider.dart';
import '../../providers/family_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Bine ai venit în Garajul Meu! Pentru a începe, te rugăm să creezi sau să te alături unei familii.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
            const SizedBox(height: 40),
            AppButton(
              text: 'Creează o familie',
              onPressed: () async {
                final user = ref.read(authStateProvider).value;
                if (user == null) return;

                final controller = TextEditingController();

                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Creează o familie'),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Numele familiei (ex: Familia Popescu)',
                      ),
                    ),
                    actions: [
                      AppButton(
                        text: 'Anulează',
                        type: AppButtonType.secondary,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      AppButton(
                        text: 'Creează',
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                );

                if (confirmed == true && controller.text.isNotEmpty) {
                  await ref
                      .read(familyService)
                      .createFamily(user.uid, controller.text);
                }
              },
            ),
            const SizedBox(height: 16),
            AppButton(
              text: 'Alătură-te unei familii',
              onPressed: () async {
                final user = ref.read(authStateProvider).value;
                if (user == null) return;

                final controller = TextEditingController();

                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Alătură-te unei familii'),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Codul de invitație',
                      ),
                    ),
                    actions: [
                      AppButton(
                        text: 'Anulează',
                        type: AppButtonType.secondary,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      AppButton(
                        text: 'Alătură-te',
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                );

                if (confirmed == true && controller.text.isNotEmpty) {
                  try {
                    await ref
                        .read(familyService)
                        .joinFamily(user.uid, controller.text);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Codul de invitație nu există.'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
