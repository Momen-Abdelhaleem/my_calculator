import 'package:flutter/material.dart';
import 'package:my_calculator/providers/calculator_provider.dart';
import 'package:my_calculator/screens/calculator_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CalculatorProvider(),
    child: CalculatorApp(),
  ));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorView(),
    );
  }
}
