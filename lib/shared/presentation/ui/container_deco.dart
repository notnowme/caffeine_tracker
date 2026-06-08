import 'package:flutter/material.dart';

List<BoxShadow> boxShadows() {
  return [
    BoxShadow(
      color: Color.from(
        alpha: 0.04,
        red: 40 / 255,
        green: 28 / 255,
        blue: 16 / 255,
      ),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color.from(
        alpha: 0.04,
        red: 40 / 255,
        green: 28 / 255,
        blue: 16 / 255,
      ),
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];
}
