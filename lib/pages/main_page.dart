import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/bloc/event.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';

class MainPage extends StatelessWidget {
  String link;
  List<dynamic> loadedUser;

  MainPage(List<dynamic> _loadedUser, String _link) {
    loadedUser = _loadedUser;
    link = _link;
  }

  @override
  Widget build(BuildContext context) {
    final VkBloc vkBloc = BlocProvider.of<VkBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Главная'), backgroundColor: Colors.blue,),
        body: Center(
      child: Container(
          child: Column(children: [
        SizedBox(
          height: 40.0,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(75.0),
            child: Image.network(
              loadedUser[0].photo_200,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Text(
            '${loadedUser[0].first_name} ${loadedUser[0].last_name}',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 80.0,
        ),
        Center(
            child: Container(
          width: 200.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              vkBloc.add(VkMainPage());
            },
            color: Colors.blue,
            child: Text('Мой профиль'),
          ),
        )),
        Center(
            child: Container(
          width: 200.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              vkBloc.add(VkDialogPage());
            },
            color: Colors.white54,
            child: Text('Мои сообщения'),
          ),
        )),
        Center(
            child: Container(
          width: 200.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              vkBloc.add(VkFriendsPage(link));
            },
            color: Colors.blue,
            child: Text('Мои друзья'),
          ),
        ))
      ])),
    ));
  }
}
