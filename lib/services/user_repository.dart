import 'package:vk_bloc/model/user.dart';
import 'package:vk_bloc/services/user_api_provider.dart';

class UserRepository {
  UserProvider _userProvider = UserProvider();

  //Future<List<User>>getAllUsers() => _userProvider.getUser(link);
  Future <List<User>> getAllUsers(String _link) {
    return _userProvider.getUser(_link);
  }
}

class FriendRepository{
  FriendProvider _friendProvider = FriendProvider();
  Future <List<Friend>> getAllFriend(String _link){
    return _friendProvider.getFriend(_link);
  }
}
