abstract class VkEvent {}

class VkLoadPage extends VkEvent {
  String link;

  VkLoadPage(String _link) {
    link = _link;
  }

  String getLink() => link;
}

class VkFriendsPage extends VkEvent {
  String link;

  VkFriendsPage(String _link) {
    link = _link;
  }

  String getLink() => link;
}

class VkMainPage extends VkEvent {}

class VkDialogPage extends VkEvent {}
