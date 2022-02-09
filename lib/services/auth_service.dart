import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:chat_flutter_app/models/user.dart';
import 'package:chat_flutter_app/models/login_response.dart';

import 'package:chat_flutter_app/global/environment.dart';

class AuthService with ChangeNotifier {
  final String _uri = Environment.apiURLdev;

  late User user;
  bool _validating = false;

  bool get validating => _validating;

  set validating(bool validating) {
    _validating = validating;
    notifyListeners();
  }

  Future loginUser(String userEmail, String userPass) async {
    validating = true;

    final data = {
      'userEmail': userEmail,
      'userPass': userPass,
    };

    final resp = await http.post(
      Uri.parse('$_uri/login'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(resp.body);
    validating = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      user = loginResponse.user;
      return true;
    } else {
      return false;
    }
  }
}
