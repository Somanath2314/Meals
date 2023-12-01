import 'package:flutter/material.dart';

class Category {
  Category({required this.id, required this.title, this.color = Colors.yellow});

  String id;
  String title;
  Color color;
}
