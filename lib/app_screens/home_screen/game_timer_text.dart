import 'package:flutter/material.dart';

class GameTimer extends StatelessWidget {
  GameTimer({Key? key, required this.year});
  int year;

  @override
  build(BuildContext context) {

    String timerText = 'Année $year';

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
