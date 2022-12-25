import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_hackathon/main/service/authenticationService.dart';
import 'package:supabase_hackathon/views/home/homeScreen.dart';

import '../../constants/constant.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService authenticationService = AuthenticationService();

  Future<String?> signUp({
    required String email,
    required String password,
    // required String phone,
    required BuildContext context,
  }) async {
    try {
      var res = await authenticationService.signUp(
        email: email,
        password: password,
        // phone: phone,
        context: context,
      );

      log(res.toString() + "Auth Notifier");
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: primaryColor,
        ),
      );
      log("Error -----------  is ------------      " + error.toString());
    }
  }

  Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var res = await authenticationService.login(
        email: email,
        password: password,
        context: context,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: primaryColor,
        ),
      );
      log("Error -----------  is ------------      " + error.toString());
    }
  }

  Future<String?> addUserToDatabase({
    token,
    fullName,
    email,
    city,
    country,
  }) async {
    dynamic res = await authenticationService.addUserToDatabase(
      token: token,
      fullName: fullName,
      email: email,
      city: city,
      country: country,
    );

    print(res.toString());
  }
}
