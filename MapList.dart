void main() {
  String name = "Dave B. Lausa";
  int age = 22;
  bool male = true;
  double weight = 50.25;
  List<String> fruits = ["Mango", "Orange", "Santol"];
  //List<dynamic> number = ["Dave",22];
  Map<String, dynamic> myData = {
    "name": name,
    "age": age,
    "male": male,
    "weight": weight,
    "fruits": fruits,
  };
  fruits.addAll(["Apple", "Banana"]);
  fruits.sort();
  bool val = fruits.contains("Mango");
  print(myData);
  print(val);
  print(myData["name"]);
  print(myData["age"]);
  print(myData.values.toList());
}
