import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WebViewLine extends StatefulWidget {
  const WebViewLine({super.key});

  @override
  State<WebViewLine> createState() => _WebViewLineState();
}

class _WebViewLineState extends State<WebViewLine> {
  final getToken = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) async {
          if (request.url.startsWith("http://localhost")) {
            Uri url = Uri.parse(request.url);
            String? code = url.queryParameters['code'];

            if (code != null) {
              http.Response res = await http.post(
                Uri.parse(
                    'https://notify-bot.line.me/oauth/token?grant_type=authorization_code&code=$code&redirect_uri=http://localhost&client_id=N5XKUsHXVSMCbNAbun3XCa&client_secret=RmznjwfjfGiyItzxqyDAIVjD0H5lRMQ2fyo2bWYQZgg'),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
              );

              String token = jsonDecode(res.body)['access_token'];
              getToken.write(key: 'Token', value: token);
            }

            Navigator.of(this.context).pop();

            return NavigationDecision.prevent;
          }

          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(
          'https://notify-bot.line.me/oauth/authorize?response_type=code&client_id=N5XKUsHXVSMCbNAbun3XCa&redirect_uri=http://localhost&scope=notify&state=benz'));

    return SafeArea(child: WebViewWidget(controller: controller));
  }
}
