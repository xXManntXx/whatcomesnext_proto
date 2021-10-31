import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/app_screens/complete_appbar.dart';

import 'home_screen/island.dart';

class CompAppbarWidget extends CompleteAppbar implements PreferredSizeWidget{
  CompAppbarWidget({required Island myIsland,Key? key}) : super(myIsland :myIsland, key: key);

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
