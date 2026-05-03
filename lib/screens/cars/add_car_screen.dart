import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/widgets/app_button.dart';
import 'package:intl/intl.dart';

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
  final _insuranceController = TextEditingController();
  final _itpController = TextEditingController();
  final _vignetteController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
    _yearController.dispose();
    _insuranceController.dispose();
    _itpController.dispose();
    _vignetteController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      controller.text = DateFormat('dd.MM.yyyy').format(picked);
    }
  }

  DateTime? _parseDate(String text) {
    if (text.isEmpty) return null;
    return DateFormat('dd.MM.yyyy').parse(text);
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
                      final year = int.tryParse(value);
                      if (year == null) {
                        return 'Anul trebuie să fie un număr.';
                      }
                      if (year < 1900 || year > DateTime.now().year) {
                        return 'Introdu un an valid (1900 - ${DateTime.now().year}).';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _insuranceController,
                    readOnly: true,
                    onTap: () => _pickDate(context, _insuranceController),
                    decoration: InputDecoration(
                      labelText: 'RCA (opțional)',
                      hintText: 'Selectează data expirării',
                      prefixIcon: Icon(Icons.shield_outlined),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _itpController,
                    readOnly: true,
                    onTap: () => _pickDate(context, _itpController),
                    decoration: InputDecoration(
                      labelText: 'ITP (opțional)',
                      hintText: 'Selectează data expirării',
                      prefixIcon: Icon(Icons.shield_outlined),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _vignetteController,
                    readOnly: true,
                    onTap: () => _pickDate(context, _vignetteController),
                    decoration: InputDecoration(
                      labelText: 'Rovinietă (opțional)',
                      hintText: 'Selectează data expirării',
                      prefixIcon: Icon(Icons.shield_outlined),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  SizedBox(height: 40),
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
                          plate: _plateController.text.toUpperCase(),
                          year: int.parse(_yearController.text),
                          insuranceExpiry: _parseDate(
                            _insuranceController.text,
                          ),
                          itpExpiry: _parseDate(_itpController.text),
                          vignetteExpiry: _parseDate(_vignetteController.text),
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
