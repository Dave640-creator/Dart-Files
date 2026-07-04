void main() {
  String name = "Dave B. Lausa";
  int age = 22;
  bool male = true;
  double weight = 50.25;
  List<String> Favorites = ["Mango", "Orange", "Santol"];
  //List<dynamic> number = ["Dave",22];
  Map<String, dynamic> myData = {
    "name": name,
    "age": age,
    "male": male,
    "weight": weight,
    "Favorites": Favorites,
  };

  print(myData);
}
