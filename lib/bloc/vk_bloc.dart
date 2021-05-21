import 'package:vk_bloc/bloc/event.dart';
import 'package:vk_bloc/bloc/state.dart';
import 'package:vk_bloc/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/model/user.dart';

class VkBloc extends Bloc<VkEvent, VkState> {
  final UserRepository userRepository;
  final friendRepository = FriendRepository();

  VkBloc({this.userRepository})
      : assert(userRepository != null),
        super(null);

  @override
  Stream<VkState> mapEventToState(VkEvent event) async* {
    if (event is VkLoadPage) {
      yield VkLoadingState();
      try {
        final List<User> _loadedUserList =
            await userRepository.getAllUsers(event.getLink());
        yield VkLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield VkErrorState();
      }
    } else if (event is VkMainPage) {
      yield VkLoadedMainPageState();
    } else if (event is VkFriendsPage) {
      yield VkLoadingState();

        final List<Friend> _loadedFriendList =
            await friendRepository.getAllFriend(event.getLink());
        yield VkLoadedFriendState(loadedFriend: _loadedFriendList);

    }
  }
}

//final List<User> _loadedUserList = await userRepository.getAllUsers(userRepository.getLink());

/*@override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await userRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
 */
