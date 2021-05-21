import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/bloc/event.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';
import 'package:vk_bloc/model/user.dart';

class FriendPage extends StatelessWidget {
  List<dynamic> loadedFriend;
  String link;

  FriendPage(List<dynamic> _loadedFriend, String _link) {
    loadedFriend = _loadedFriend;
    link = _link;
  }

  @override
  Widget build(BuildContext context) {
    final VkBloc vkBloc = BlocProvider.of<VkBloc>(context);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              vkBloc.add(VkLoadPage(link));
            },
          ),
        ),
        appBar: AppBar(
          title: Text('Друзья'),
          backgroundColor: Colors.blue,
        ),
        body: new ListView.builder(
          itemCount: loadedFriend.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: new ClipRRect(
                  child: new Image.network(
                    loadedFriend[index].photo_50,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(200.0),
                ),
                title: new Text(
                    '${loadedFriend[index].first_name} ${loadedFriend[index].last_name}',
                    style: new TextStyle(fontSize: 15.0),
                    overflow: TextOverflow.ellipsis),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              MyOneFriend(loadedFriend[index]),
                          transitionsBuilder: (___, Animation<double> animation,
                              ____, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          }));
                });
          },
        ));
  }
}

class MyOneFriend extends StatelessWidget {
  Friend friend;

  MyOneFriend(Friend _friend) {
    friend = _friend;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${friend.first_name} ${friend.last_name} '),
      content: new ClipRRect(
        child: new Image.network(
          friend.photo_200,
          width: 200.0,
          height: 200.0,
          fit: BoxFit.fitHeight,
        ),
        borderRadius: BorderRadius.circular(200.0),
      ),
      contentPadding: EdgeInsets.all(70.0),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Закрыть'),
        ),
      ],
    );
  }
}
