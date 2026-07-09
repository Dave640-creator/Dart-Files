void main() {
  String? nickname;

  print(nickname ?? "No nickname");

  nickname = "Dave";

  print(nickname);

  print(nickname!.length);
}
