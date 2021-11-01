class Event{
  String _eventName ;
  String _eventContent;

  //define all events below
  Event.testEvent():
  _eventName = "Test event",
  _eventContent = "Ceci est un évennement test pour pouvoir le tester !" ;

  String get content => _eventContent;

  String get name => _eventName;
}