import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/widgets/app_button.dart';
import 'package:intl/intl.dart';
import 'package:garajulmeu/models/maintenance.dart';
import 'package:garajulmeu/providers/maintenance_provider.dart';
import 'package:garajulmeu/widgets/app_scaffold.dart';

const _maintenanceTypes = [
  'Schimb ulei',
  'Filtre aer',
  'Filtre combustibil',
  'Filtre polen',
  'Plăcuțe frână',
  'Discuri frână',
  'Distribuție',
  'Revizie generală',
  'Altele',
];

class AddMaintenanceScreen extends ConsumerStatefulWidget {
  final String carId;
  final String familyId;

  const AddMaintenanceScreen({
    super.key,
    required this.carId,
    required this.familyId,
  });

  @override
  ConsumerState<AddMaintenanceScreen> createState() =>
      _AddMaintenanceScreenState();
}

class _AddMaintenanceScreenState extends ConsumerState<AddMaintenanceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _mileageController = TextEditingController();
  final _notesController = TextEditingController();
  final _nextDateController = TextEditingController();
  final _nextMileageController = TextEditingController();

  String? _selectedType;

  @override
  void dispose() {
    _dateController.dispose();
    _mileageController.dispose();
    _notesController.dispose();
    _nextDateController.dispose();
    _nextMileageController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(
    BuildContext context,
    TextEditingController controller, {
    bool future = false,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: future ? DateTime.now() : DateTime(2000),
      lastDate: future
          ? DateTime.now().add(const Duration(days: 365 * 5))
          : DateTime.now(),
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
      title: 'Adaugă Mentenanță',
      bottomWidget: AppButton(
        text: 'Salvează',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final maintenance = Maintenance(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              carId: widget.carId,
              type: _selectedType!,
              date: _parseDate(_dateController.text)!,
              mileage: int.parse(_mileageController.text),
              notes: _notesController.text.isEmpty
                  ? null
                  : _notesController.text,
              nextDate: _parseDate(_nextDateController.text),
              nextMileage: _nextMileageController.text.isEmpty
                  ? null
                  : int.tryParse(_nextMileageController.text),
            );

            await ref
                .read(maintenanceServiceProvider)
                .addMaintenanceRecord(
                  widget.familyId,
                  widget.carId,
                  maintenance,
                );
            if (context.mounted) Navigator.of(context).pop();
          }
        },
        type: AppButtonType.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Adaugă o înregistrare de mentenanță'),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Tip mentenanță',
                      prefixIcon: Icon(Icons.build_outlined),
                    ),
                    items: _maintenanceTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => _selectedType = value),
                    validator: (value) => value == null
                        ? 'Selectează tipul de mentenanță.'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _pickDate(context, _dateController),
                    decoration: const InputDecoration(
                      labelText: 'Data efectuării',
                      hintText: 'Selectează data',
                      prefixIcon: Icon(Icons.calendar_today),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Selectează data efectuării.'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _mileageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Kilometraj',
                      hintText: 'ex: 87500',
                      prefixIcon: Icon(Icons.speed),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Introduceți kilometrajul.';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Kilometrajul trebuie să fie un număr.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Note (opțional)',
                      hintText: 'ex: Castrol 5W-40',
                      prefixIcon: Icon(Icons.notes),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Următoarea mentenanță (opțional)',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nextDateController,
                    readOnly: true,
                    onTap: () =>
                        _pickDate(context, _nextDateController, future: true),
                    decoration: const InputDecoration(
                      labelText: 'Data următoare',
                      hintText: 'Selectează data',
                      prefixIcon: Icon(Icons.event),
                      suffixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _nextMileageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Kilometraj următor',
                      hintText: 'ex: 97500',
                      prefixIcon: Icon(Icons.speed_outlined),
                    ),
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
