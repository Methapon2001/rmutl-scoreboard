import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoreboard/widgets/bar.dart';
import 'dart:convert';

import 'package:scoreboard/widgets/menu.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final String _lineNotifyApiURL = 'https://notify-api.line.me/api/notify';
  final String _lineNotifyAccessToken = '2wbKLB6eME5seNpqkJNnPUwc3GXmboPZ7XPHPK44hOy';

  void _sendLineNotifyMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_lineNotifyApiURL),
        headers: {
          'Authorization': 'Bearer $_lineNotifyAccessToken',
        },
        body: {
          'message': message,
        },
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully!');
      } else {
        print('Failed to send notification: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Titlebar().appBar('L I N E'),
      backgroundColor: MyBackgroundColor,
      drawer: const MenuDrawer(index: 8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Enter your message'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String message = _messageController.text;
                  _sendLineNotifyMessage(message);
                },
                child: Text('Send Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}