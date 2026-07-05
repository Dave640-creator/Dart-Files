void main() {
  String Name = "Dave B. Lausa";
  int age = 22;

  Map<String, dynamic> myInfo = {"Name": Name, "age": age};

  List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<String> names = ["dave", "abegail", "botit"];

  for (int i = 1; i <= number.length; i++) {
    print(i);
  }

  for (var name in names) {
    print(name);
  }

  var name = "dave";
}
