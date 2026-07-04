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
  fruits.add("Apple");
  print(myData);
}
