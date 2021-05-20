import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vk_bloc/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';
import 'package:vk_bloc/services/user_repository.dart';

//https://oauth.vk.com/authorize?client_id=7833371&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52
void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  final usersRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VkBloc>(
      create: (context) => VkBloc(userRepository: usersRepository),
      child: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
