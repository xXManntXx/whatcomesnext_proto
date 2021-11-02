import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/app_screens/home_screen/complete_appbar.dart';
import 'package:whatcomesnext_proto/game_classes/archipelago.dart';

import '../../game_classes/island.dart';

class CompAppbarWidget extends CompleteAppbar implements PreferredSizeWidget {
  CompAppbarWidget(
      {required Archipelago myWorld, required Island myIsland, Key? key})
      : super(world: myWorld, myIsland: myIsland, key: key);

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
