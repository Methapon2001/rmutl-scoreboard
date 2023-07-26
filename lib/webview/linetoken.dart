import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoreboard/widgets/menu.dart';

class LineTokenPage extends StatefulWidget {
  const LineTokenPage({super.key});

  @override
  State<LineTokenPage> createState() => _LineTokenPageState();
}

class _LineTokenPageState extends State<LineTokenPage> {
  final String channelID = '2000217841';
  final String channelSecret = 'ea32f03941031165b034056c5ba2aa45';

  void getAccessToken() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.line.me/v2/oauth/accessToken'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'client_credentials',
          'client_id': channelID,
          'client_secret': channelSecret,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final accessToken = data['access_token'];
        print('Access Token: $accessToken');
        // You can save the accessToken or use it for Line Messaging API calls.
      } else {
        print('Failed to get access token: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Token Page'),
      ),
      drawer: MenuDrawer(index: 8),
      body: Center(
        child: Column(
          children: [
            TextFormField(),
            ElevatedButton(
              onPressed: getAccessToken,
              child: Text('Get Access Token'),
            ),
          ],
        ),
      ),
    );
  }
}
