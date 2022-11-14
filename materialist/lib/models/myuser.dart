class MyUser {
  final String? uid;

  MyUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final List groups;

  UserData(
      {required this.uid,
      required this.groups,
      required this.name});
}
