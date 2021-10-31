class Law {
  String lawName;
  int lawPrice;
  String lawContent;

  Law(
      {required this.lawName, required this.lawPrice, required this.lawContent});

  Law.testLaw()
      : lawName = "Ma loi test",
        lawPrice = 300,
        lawContent = "Ceci est une loi qu'il faut respecter.";
}
