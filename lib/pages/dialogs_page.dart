import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/bloc/event.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';

class DialogPage extends StatelessWidget {
  String link;

  DialogPage(String _link) {
    link = _link;
  }

  @override
  Widget build(BuildContext context) {
    final VkBloc vkBloc = BlocProvider.of<VkBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Text('Send'),
        ),
        bottomSheet: TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Input your text here...',
          ),
        ),
        appBar: AppBar(
          title: Text('Мои сообщения'),
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBar: BottomAppBar(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              vkBloc.add(VkLoadPage(link));
            },
          ),
        ),
        body: new ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                padding: EdgeInsets.only(
                    bottom: index == 9 ? 100.0 : 15.0,
                    top: 20.0,
                    left: index % 2 == 0 ? 10.0 : 0.0,
                    right: index % 2 == 1 ? 10.0 : 0.0),
                alignment: index % 2 == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(

                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.blueAccent : Colors.lightGreen,
                    border: Border.all(
                      style: BorderStyle.values[1],
                      color: index % 2 == 0 ? Colors.blueAccent : Colors.lightGreen,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: index  == 7 ? Text('ыфдоа ыфлоадыфоаждфлыа лфыжда лфыждалфжыд лаждфы лаждлфы жадлфы аджфыл аждлы фжда лфы') : Text('Message: $index'),
                ),
              );
            }));
  }
}
