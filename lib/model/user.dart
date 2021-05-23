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
  int id;

  Friend ({this.first_name, this.last_name, this.photo_50, this.photo_200, this.id});
  factory Friend.fromJson(Map<String, dynamic> json){
    return Friend(
      id: json['id'],
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

class AccessToken{
  String _access_token;
  void setAccessToken(String _link){
    var uri = Uri.parse(_link);
    _access_token = uri.fragment.split('&')[0];
    _access_token = _access_token.split('=')[1];
  }
  String getAccessToken(){
    return _access_token;
  }
}