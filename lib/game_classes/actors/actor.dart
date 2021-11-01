abstract class Actor {
  String _actorName;
  String _actorContent;
  int _actorBudget;

  Actor({required String name, required String content, required int budget})
      : _actorName = name,
        _actorContent = content,
        _actorBudget = budget;


  //GETTER AND SETTER
  int get budget => _actorBudget;

  set budget(int value) {
    _actorBudget = value;
  }

  String get content => _actorContent;

  String get name => _actorName;
}
