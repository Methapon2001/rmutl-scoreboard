import 'dart:io';
import 'package:http/http.dart' as http;

class LineNotify {
  Future<http.Response?> sendNotify(String token, String message) async {
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
    };
    return await http.post(
        Uri.parse('https://notify-api.line.me/api/notify?message=$message'),
        headers: headers);
  }
}
