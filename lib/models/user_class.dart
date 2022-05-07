class User {
  int? id;
  String name;
  String email;
  String? urlAvatar;
  String? telegram;

  User({this.id, this.name = "", this.email = "", this.urlAvatar, this.telegram});
}