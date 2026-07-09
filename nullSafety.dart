import "dart:io";

void main() {
  String? name = null;
  print(name);

  String? name2;

  if (name2 != null) {
    print(name2.length);
  }

  String? name3 = null;

  print(name?.length);

  String? name4 = null;

  print(name4 ?? "Unknown");

  int? age = null;

  print(age ?? 0);

  String? name5 = "dave";

  print(name5!.length);
}
