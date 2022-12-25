import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_hackathon/credentials/supabase.creds.dart';
import '../../constants/constant.dart';
import '../../providers/authSuccessProvider.dart';

class AuthenticationService {
  Future<AuthResponse?> signUp({
    required String email,
    required String password,
    // required String phone,
    required BuildContext context,
  }) async {
    AuthResponse res = await SupaBaseCredentials.sbClient.auth.signUp(
      password: password,
      email: email,
    );

    if (res.session == null) {
      String? userEmail = res.user!.email;
      String? token = res.session!.accessToken;

      log(token.toString() + "  token");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign up succesful"),
          backgroundColor: primaryColor,
        ),
      );
      context.read<AuthSuccessProvider>().authIsSuccess(true);
      log("Sign up succesful $userEmail");
      return res;
    } else {
      log("Sign up error ${res.session}");
    }
  }

  Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    AuthResponse res = await SupaBaseCredentials.sbClient.auth
        .signInWithPassword(password: password, email: email);

    print(res.session);
    print(res.user);

    final Session? session = res.session;

    if (session == null) {
      log("Login error ${res.session}");
    } else {
      String? userEmail = res.user!.email;
      context.read<AuthSuccessProvider>().authIsSuccess(true);
      log("Login succesful $userEmail");
    }
    return null;
  }

  addUserToDatabase({
    String? token,
    String? fullName,
    String? city,
    String? country,
    String? email,
  }) async {
    SupaBaseCredentials.sbClient.from("UserDatabase").insert({
      'id': token,
      'created_at': DateTime.now(),
      'userName': fullName,
      'mobileNumber': 'Null',
      'city': city,
      'country': country,
      'email': email,
    }).execute();
  }
}
