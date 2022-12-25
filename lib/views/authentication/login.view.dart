import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:supabase_hackathon/constants/constant.dart';
import 'package:supabase_hackathon/routes/app.routes.dart';

import '../../constants/showLoader.dart';
import '../../constants/textFieldLoginView.dart';
import '../../main/Notifier/authentication.notifier.dart';
import '../../providers/authSuccessProvider.dart';
import '../../providers/loadingProvider.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);

    final LoadingProvider loadNow =
        Provider.of<LoadingProvider>(context, listen: false);

    final bool authSuccess =
        Provider.of<AuthSuccessProvider>(context).authSuccess;

    loginUser(emailIs, passwordIS) async {
      loadNow.isLoading(true);

      if (emailIs.isEmpty && passwordIS.isEmpty) {
        log("Please provide all details ");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please provide all details"),
            backgroundColor: primaryColor,
          ),
        );
      } else {
        loadNow.load == true
            ? Loader().showLoaderNow(context)
            : const SizedBox();
        await authenticationNotifier.login(
          email: emailIs,
          password: passwordIS,
          context: context,
        );
        context.read<AuthSuccessProvider>().authSuccess == true
            ? Navigator.of(context).pushNamedAndRemoveUntil(
                '/homescreen', (Route<dynamic> route) => false)
            : Navigator.pop(context);
      }

      loadNow.isLoading(false);
    }

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "StoreIt Login",
            style: TextStyle(color: primaryColor),
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: emailController,
              hintText: "Enter email",
            ),
            TextFieldWidget(
              controller: passwordController,
              hintText: "Enter password",
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              // style: ButtonStyle(
              //   shape:
              // ),
              onPressed: () async {
                loginUser(emailController.text, passwordController.text);
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.signUpRoute);
                },
                child: const Text(
                  "New here? Create an account...",
                  style: TextStyle(color: Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
