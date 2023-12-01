import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class mealItemBottom extends StatelessWidget {
  mealItemBottom({super.key, required this.label, required this.icon});
  final IconData icon;
  String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
