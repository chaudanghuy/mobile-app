import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:wordpress_app/config/wp_config.dart';
import '../models/user.dart';

class AuthService {
  static var client = http.Client();

  static Future<UserModel?> loginWithEmail(String userName, String password) async {
    Map<String, String> _requestHeader = {
      'Content-type': 'application/x-www-form-urlencoded',
    };

    var response = await client.post(Uri.parse("${WpConfig.websiteUrl}/wp-json/jwt-auth/v1/token"),
        headers: _requestHeader,
        body: {"username": userName, "password": password});
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      debugPrint(decoded['token']);
      UserModel userModel = UserModel(
          userName: decoded['user_display_name'],
          emailId: decoded['user_email'],
          password: password,
          token: decoded['token']
      );

      return userModel;
    } else {
      return null;
    }
  }


  static Future<UserResponseModel> createUser(UserModel model) async {
    Map<String, String> _requestHeader = {'Content-type': 'application/json'};

    var response = await client.post(
      Uri.parse("${WpConfig.websiteUrl}/wp-json/wp/v2/users/register"),
      headers: _requestHeader,
      body: jsonEncode(model.toJson()),
    );

    return userResponseFromJson(response.body);
  }



  static Future<bool> sendPasswordResetEmail(String email) async {
    String url = "${WpConfig.websiteUrl}/wp-login.php?action=lostpassword";

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data; charset=UTF-8',
      'Accept': 'application/json',
    };

    Map<String, String> body = {'user_login': email};

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(body)
      ..headers.addAll(headers);

    var response = await request.send();
    debugPrint('response: ${response.statusCode}');
    if(response.statusCode == 302){
      return true;
    }else if (response.statusCode == 200){
      Fluttertoast.showToast(msg: 'No Users Exist with this email');
      return false;
    }else{
      Fluttertoast.showToast(msg: 'Failed to send. Please try again later.');
      return false;
    }
  }

  static Future<bool> deleteUserAccount(String token) async {
    const url = '${WpConfig.websiteUrl}/wp-json/remove_user/v1/user/me';
    try {
      final response = await client.delete(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        debugPrint('User deleted successfully');
        debugPrint(response.body.toString());
        return true;
      } else {
        debugPrint(response.statusCode.toString());
        debugPrint(response.body.toString());
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error while deleting user');
      debugPrint('error: $e');
      return false;
    }
  }
}
