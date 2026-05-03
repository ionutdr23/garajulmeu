import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/widgets/app_button.dart';

import '../../models/car.dart';
import '../../providers/auth_provider.dart';
import '../../providers/car_provider.dart';
import '../../providers/user_profile_provider.dart';
import '../../widgets/app_scaffold.dart';

class AddCarScreen extends ConsumerStatefulWidget {
  const AddCarScreen({super.key});

  @override
  ConsumerState<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends ConsumerState<AddCarScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _plateController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Adaugă Mașină',
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Adaugă o mașină nouă'),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nume Mașină',
                      hintText: 'ex: Dacia Logan',
                      prefixIcon: Icon(Icons.directions_car),
                    ),
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Te rugăm să introduci un nume pentru mașină.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Număr Înmatriculare',
                      hintText: 'ex: PH12ABC',
                      prefixIcon: Icon(Icons.confirmation_number),
                    ),
                    controller: _plateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Te rugăm să introduci un număr de înmatriculare.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'An Fabricație',
                      hintText: 'ex: 2020',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _yearController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Te rugăm să introduci anul de fabricație.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  AppButton(
                    text: 'Salvează',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final user = ref.read(authStateProvider).value;
                        final userProfile = ref
                            .read(userProfileProvider(user!.uid))
                            .value;
                        final familyId = userProfile!.familyId!;

                        final car = Car(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: _nameController.text,
                          plate: _plateController.text,
                          year: int.parse(_yearController.text),
                        );

                        await ref
                            .read(carServiceProvider)
                            .addCar(familyId, car);
                        if (context.mounted) Navigator.of(context).pop();
                      }
                    },
                    type: AppButtonType.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
