class User {
  int? id;
  String name;
  String email;
  String? urlAvatar;
  String? telegram;

  User({this.id, this.name = "", this.email = "", this.urlAvatar, this.telegram});

  factory User.fromApi(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        urlAvatar: json['imageUrl'],
        telegram: json['telegramUrl'] );
  }
}