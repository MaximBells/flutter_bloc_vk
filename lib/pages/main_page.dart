import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_bloc/bloc/state.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  List<dynamic> mainUser;
  String link;

  MainPage(List<dynamic> _mainUser, String _link) {
    link = _link;
    mainUser = _mainUser;
  }

  @override
  Widget build(BuildContext context) {
    final VkPageBloc vkBloc = BlocProvider.of<VkPageBloc>(context);
    return BlocBuilder<VkPageBloc, VkState>(builder: (context, state) {
      if (state is VkLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is VkErrorState) {
        return Center(child: Text('error'));
      }
      if (state is VkLoadedFrinedState){
        return Center(child: Text('success'),);
      }
      if (state is VkLoadedMainPageState){}


      return Scaffold(
          body: Column(children: [
            SizedBox(
              height: 60.0,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75.0),
                child: Image.network(
                  mainUser[0].photo_200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Text(
                mainUser[0].first_name,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                mainUser[0].last_name,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            )
          ]));
    });
  }
}
