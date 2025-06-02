import 'package:flutter/material.dart';
import 'package:my_calculator/providers/calculator_provider.dart';
import 'package:my_calculator/widgets/calculator_buttons.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});
  final List<String> buttons = const [
    'AC',
    '%',
    '\u232B',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    '.',
    '=',
  ];
  Color buttonColor(String value) {
    return int.tryParse(value) == null ? Colors.grey[800]! : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final numProvider = Provider.of<CalculatorProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          //input and result screen
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      '${numProvider.number1}${numProvider.operand}${numProvider.number2}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      numProvider.result,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: GridView.builder(
                //بتديني شكل الشبكة اللي زي نظام زراير الالة الحاسبة
                itemCount: buttons.length,
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //اللي بالعرض items  بتثبت عدد ال
                  crossAxisCount: 4,
                  crossAxisSpacing: screenSize.width / 30,
                  mainAxisSpacing: screenSize.height / 40,
                ),
                itemBuilder: (context, index) => CalculatorButton(
                    color: buttons[index] == '.'
                        ? Colors.green
                        : buttons[index] == '='
                            ? Colors.orange
                            : buttonColor(buttons[index]),
                    onPressed: () {
                      final provider = Provider.of<CalculatorProvider>(context,
                          listen: false);
                      if (buttons[index] == 'AC') {
                        provider.clear();
                      } else if (buttons[index] == '%') {
                        provider.calculatePercentage();
                      } else if (buttons[index] == '\u232B') {
                        provider.delete();
                      } else if (buttons[index] == '=') {
                        provider.calculateResult();
                      } else {
                        provider.addValue(buttons[index]);
                      }
                    },
                    text: buttons[index]),
              ))
        ],
      ),
    );
  }
}
