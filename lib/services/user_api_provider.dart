import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vk_bloc/model/user.dart';
import 'dart:async';

class UserProvider {
  String access_token = '';
  String user_id = '';

  Future<List<User>> getUser(String link) async {
    var uri = Uri.parse(link);
    access_token = uri.fragment.split('&')[0];
    access_token = access_token.split('=')[1];
    user_id = uri.fragment.split('&')[2];
    user_id = user_id.split('=')[1];
    print(access_token);
    print(user_id);
    var url = Uri.parse(
        'https://api.vk.com/method/users.get?user_id=$user_id&access_token=$access_token&v=5.52&fields=photo_200');
    var responseAccount = await http.get(url);
    if (responseAccount.statusCode == 200) {
      print(jsonDecode(responseAccount.body)['response']);
      final List<dynamic> userJson =
          jsonDecode(responseAccount.body)['response'];
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}

class FriendProvider {
  String access_token = '';
  String user_id = '';

  Future<List<Friend>> getFriend(String link) async {
    var uri = Uri.parse(link);
    access_token = uri.fragment.split('&')[0];
    access_token = access_token.split('=')[1];
    user_id = uri.fragment.split('&')[2];
    user_id = user_id.split('=')[1];
    var url = Uri.parse(
        'https://api.vk.com/method/friends.get?user_id=$user_id&access_token=$access_token&v=5.110&fields=nickname,photo_50,photo_200');
    var responseAccount = await http.get(url);
    if (responseAccount.statusCode == 200) {
      print(jsonDecode(responseAccount.body)['response']['items']);
      final List<dynamic> friendJson =
          jsonDecode(responseAccount.body)['response']['items'];
      return friendJson.map((json) => Friend.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching friends');
    }
  }
}
