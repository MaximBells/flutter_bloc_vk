import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/bloc/event.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';

class Profile extends StatelessWidget {
  List<dynamic> loadedUser;
  String link;

  Profile(List<dynamic> _loadedUser, String _link) {
    loadedUser = _loadedUser;
    link = _link;
  }

  @override
  Widget build(BuildContext context) {
    final VkBloc vkBloc = BlocProvider.of<VkBloc>(context);
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                vkBloc.add(VkLoadPage(link));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Text('Личный профиль '),
            backgroundColor: Colors.blue,
          ),
          body: Column(children: [
            SizedBox(
              height: 60.0,
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
                loadedUser[0].first_name,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                loadedUser[0].last_name,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            )
          ])),
      onWillPop: () async {
        //Замена события
        vkBloc.add(VkLoadPage(link));
        return false;
      },
    );
  }
}
