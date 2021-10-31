import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/app_screens/home_screen/island.dart';

class LawScreen extends StatefulWidget {
  Island myIsland;

  LawScreen(this.myIsland, {Key? key}) : super(key: key);
  @override
  _LawScreenState createState() => _LawScreenState(myIsland);
}

class _LawScreenState extends State<LawScreen> {

  Island myIsland;

  _LawScreenState(this.myIsland);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: myIsland.getLawListView(),
      ),
    );
  }
}
