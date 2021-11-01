import 'package:whatcomesnext_proto/game_classes/events/event.dart';

class TestEvent extends Event {
  TestEvent()
      : super(
            name: "évennement test surprise !",
            content:
                "Ceci est un évennement test ! Il ne fait absolument rien");
}
