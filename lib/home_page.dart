import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_bloc/bloc/event.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';
import 'bloc/state.dart';

import 'package:vk_bloc/model/user.dart';
import 'package:vk_bloc/pages/friends_page.dart';
import 'package:vk_bloc/pages/main_page.dart';
import 'package:vk_bloc/pages/profile.dart';
import 'package:vk_bloc/pages/dialogs_page.dart';

class HomePage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String selectedUrl =
      'https://oauth.vk.com/authorize?client_id=7833371&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52';

  @override
  Widget build(BuildContext context) {
    var link = LinkGet();
    var access_token = AccessToken();
    List<dynamic> loadedUser;
    final VkBloc vkBloc = BlocProvider.of<VkBloc>(context);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    return BlocBuilder<VkBloc, VkState>(builder: (context, state) {
      if (state is VkLoadedState) {
        loadedUser = state.loadedUser;
        return MainPage(state.loadedUser, link.getLink());
      }
      if (state is VkLoadedMainPageState) {
        return Profile(loadedUser, link.getLink());
      }
      if (state is VkLoadedFriendState) {
        return FriendPage(state.loadedFriend, link.getLink());
      }
      if (state is VkLoadedDialogState) {
        return DialogPage(link.getLink());
      }
      if (state is VkLoadingState) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Загрузка...'),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is VkErrorState) {
        return Scaffold(
          appBar: AppBar(title: Text('Ошибка...'), backgroundColor: Colors.blue,),
            body: Center(
                // ignore: deprecated_member_use
                child: RaisedButton(
          onPressed: () {
            vkBloc.add(VkLoadPage(link.getLink()));
          },
          child: Text('Error. Press to Reconnect'),
          color: Colors.red,
        )));
      }
      return Container(
        padding: EdgeInsets.only(left: 0.0, top: 40.0, right: 0.0, bottom: 0.0),
        child: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          navigationDelegate: (NavigationRequest request) async {
            if (request.url.startsWith('https://oauth.vk.com/blank.html')) {
              link.setLink(request.url);
              access_token.setAccessToken(request.url);
              vkBloc.add(VkLoadPage(request.url));
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    });
  }
}
