// import 'package:flutter/material.dart';

// Widget calculatorButton({
//   required Color color,
//   required void Function() onPressed,
//   required String text,
// }) {
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//         backgroundColor: color, foregroundColor: Colors.white),
//     onPressed: onPressed,
//     child: Text(
//       text,
//       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     ),
//   );
// }

import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        // ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
