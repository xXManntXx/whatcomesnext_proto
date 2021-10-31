import 'package:flutter/material.dart';

class MyColorTheme {
  static Color? getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected,
    };
    const Set<MaterialState> inactiveStates = <MaterialState>{
      MaterialState.disabled,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.indigo;
    }
    if (states.any(inactiveStates.contains)) {
      return Colors.indigo[200];
    }
    return Colors.indigoAccent;
  }
}