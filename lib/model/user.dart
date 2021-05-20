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

class Friend {
  String first_name;
  String last_name;
  String photo_50;
  String photo_200;

  Friend ({this.first_name, this.last_name, this.photo_50, this.photo_200});
  factory Friend.fromJson(Map<String, dynamic> json){
    return Friend(
      first_name: json['first_name'],
      last_name: json['last_name'],
      photo_50: json['photo_50'],
      photo_200: json['photo_200']
    );
  }
}

class LinkGet{
  String link;
  void setLink(String _link){
    link = _link;
  }
  String getLink()=>link;
}