import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/app_screens/complete_appbar_widget.dart';
import 'package:whatcomesnext_proto/app_screens/home_screen/island.dart';

class LawScreen extends StatefulWidget {
  Island myIsland;
  CompAppbarWidget myAppBar;

  LawScreen({ required this.myIsland, required this.myAppBar, Key? key}) : super(key: key);
  @override
  _LawScreenState createState() => _LawScreenState(myIsland,myAppBar);
}

class _LawScreenState extends State<LawScreen> {

  Island myIsland;
  CompAppbarWidget myAppBar;

  _LawScreenState(this.myIsland, this.myAppBar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: myIsland.getLawListView(),
      ),
    );
  }
}
