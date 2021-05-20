import 'dart:async';
import 'dart:io';
import 'package:vk_bloc/bloc/event.dart';

import 'bloc/state.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_bloc/bloc/vk_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String selectedUrl =
      'https://oauth.vk.com/authorize?client_id=7833371&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52';

  @override
  Widget build(BuildContext context) {
    final VkBloc vkBloc = BlocProvider.of<VkBloc>(context);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    return BlocBuilder<VkBloc, VkState>(builder: (context, state) {
      if (state is VkLoadedState) {
        return Scaffold(
            body: Column(children: [
              SizedBox(
                height: 60.0,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75.0),
                  child: Image.network(
                    state.loadedUser[0].photo_200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Text(
                  state.loadedUser[0].first_name,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  state.loadedUser[0].last_name,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              )
            ]));
      }
      if (state is VkLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is VkErrorState) {
        return Center(child: Text('error'));
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
              vkBloc.add(VkLoadPage(request.url));
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    });
  }
}
