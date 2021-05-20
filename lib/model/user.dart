class User {
  int id;
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;
  String photo_200;

  // ignore: non_constant_identifier_names
  User({this.id, this.first_name, this.last_name, this.photo_200});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      photo_200: json['photo_200']
    );
  }
}
