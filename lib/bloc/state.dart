import 'package:flutter/foundation.dart';
abstract class VkState{}

class VkLoadingState extends VkState{}
class VkLoadedState extends VkState{
  List<dynamic>loadedUser;
  VkLoadedState({@required this.loadedUser}) : assert (loadedUser != null);
}
class VkLoadedMainPageState extends VkState{}
class VkLoadedFrinedState extends VkState{
  List<dynamic>loadedFriend;
  VkLoadedFrinedState({@required this.loadedFriend}) : assert (loadedFriend != null);
}
class VkErrorState extends VkState{}