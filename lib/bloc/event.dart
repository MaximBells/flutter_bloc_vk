abstract class VkEvent{}

class VkLoadPage extends VkEvent{
  String link;
  VkLoadPage(String _link){
    link = _link;
  }
  String getLink()=>link;
}

class VkFriendsPage extends VkEvent{}