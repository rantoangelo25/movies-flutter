import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_plugin/movie_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _moviePlugin = MoviePlugin();

  // Un champ "clé" et un champ "valeur" pour chaque type
  final stringKeyTextController = TextEditingController();
  final stringValueTextController = TextEditingController();
  final intKeyTextController = TextEditingController();
  final intValueTextController = TextEditingController();
  final boolKeyTextController = TextEditingController();
  final boolValueTextController = TextEditingController();
  final doubleKeyTextController = TextEditingController();
  final doubleValueTextController = TextEditingController();

  String currentStringValue = '';
  String currentIntValue = '';
  String currentBoolValue = '';
  String currentDoubleValue = '';

  @override
  void dispose() {
    for (final controller in [
      stringKeyTextController,
      stringValueTextController,
      intKeyTextController,
      intValueTextController,
      boolKeyTextController,
      boolValueTextController,
      doubleKeyTextController,
      doubleValueTextController,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Chaînes de caractères
                        ...buildSection(
                          type: 'String',
                          keyController: stringKeyTextController,
                          valueController: stringValueTextController,
                          currentValue: currentStringValue,
                          onSet: () async {
                            if (stringKeyTextController.text.isNotEmpty &&
                                stringValueTextController.text.isNotEmpty) {
                              await _moviePlugin.setString(
                                  stringKeyTextController.text,
                                  stringValueTextController.text);
                            }
                          },
                          onGet: () async {
                            if (stringKeyTextController.text.isNotEmpty) {
                              final value = await _moviePlugin
                                  .getString(stringKeyTextController.text);
                              if (value != null) {
                                setState(() => currentStringValue = value);
                              }
                            }
                          },
                          onClear: () => setState(() => currentStringValue = ''),
                        ),
                        // 2. Entiers (chiffres uniquement)
                        ...buildSection(
                          type: 'Int',
                          keyController: intKeyTextController,
                          valueController: intValueTextController,
                          currentValue: currentIntValue,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onSet: () async {
                            if (intKeyTextController.text.isNotEmpty &&
                                intValueTextController.text.isNotEmpty) {
                              await _moviePlugin.setInt(
                                  intKeyTextController.text,
                                  int.parse(intValueTextController.text));
                            }
                          },
                          onGet: () async {
                            if (intKeyTextController.text.isNotEmpty) {
                              final value = await _moviePlugin
                                  .getInt(intKeyTextController.text);
                              if (value != null) {
                                setState(() => currentIntValue = '$value');
                              }
                            }
                          },
                          onClear: () => setState(() => currentIntValue = ''),
                        ),
                        // 3. Booléens ("true" ou autre chose)
                        ...buildSection(
                          type: 'Bool',
                          keyController: boolKeyTextController,
                          valueController: boolValueTextController,
                          currentValue: currentBoolValue,
                          onSet: () async {
                            if (boolKeyTextController.text.isNotEmpty &&
                                boolValueTextController.text.isNotEmpty) {
                              await _moviePlugin.setBool(
                                  boolKeyTextController.text,
                                  boolValueTextController.text == 'true');
                            }
                          },
                          onGet: () async {
                            if (boolKeyTextController.text.isNotEmpty) {
                              final value = await _moviePlugin
                                  .getBool(boolKeyTextController.text);
                              if (value != null) {
                                setState(() => currentBoolValue = '$value');
                              }
                            }
                          },
                          onClear: () => setState(() => currentBoolValue = ''),
                        ),
                        // 4. Décimaux (2 chiffres après la virgule maximum)
                        ...buildSection(
                          type: 'Double',
                          keyController: doubleKeyTextController,
                          valueController: doubleValueTextController,
                          currentValue: currentDoubleValue,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          onSet: () async {
                            if (doubleKeyTextController.text.isNotEmpty &&
                                doubleValueTextController.text.isNotEmpty) {
                              await _moviePlugin.setDouble(
                                  doubleKeyTextController.text,
                                  double.parse(doubleValueTextController.text));
                            }
                          },
                          onGet: () async {
                            if (doubleKeyTextController.text.isNotEmpty) {
                              final value = await _moviePlugin
                                  .getDouble(doubleKeyTextController.text);
                              if (value != null) {
                                setState(() => currentDoubleValue = '$value');
                              }
                            }
                          },
                          onClear: () =>
                              setState(() => currentDoubleValue = ''),
                        ),
                      ],
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

  // Ajout : le livre répète ce bloc quatre fois (String, Int, Bool, Double).
  // Cette méthode construit une section : 2 champs, 3 boutons et le résultat.
  List<Widget> buildSection({
    required String type,
    required TextEditingController keyController,
    required TextEditingController valueController,
    required String currentValue,
    required Future<void> Function() onSet,
    required Future<void> Function() onGet,
    required VoidCallback onClear,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return [
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '$type Key',
        ),
        textInputAction: TextInputAction.next,
        controller: keyController,
      ),
      const SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '$type Value',
        ),
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: valueController,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8,
          children: [
            ElevatedButton(onPressed: onSet, child: const Text('Set Value')),
            ElevatedButton(onPressed: onGet, child: const Text('Get Value')),
            ElevatedButton(
              // "Clear" efface toutes les valeurs enregistrées par le plugin
              onPressed: () async {
                final cleared = await _moviePlugin.clear();
                if (cleared == true) {
                  onClear();
                }
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      Text('Current $type Value is $currentValue'),
      const SizedBox(height: 16),
    ];
  }
}
