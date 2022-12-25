import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_hackathon/constants/constant.dart';
import 'package:supabase_hackathon/main/Notifier/authentication.notifier.dart';
import 'package:supabase_hackathon/providers/authSuccessProvider.dart';
import 'package:supabase_hackathon/providers/loadingProvider.dart';
import 'package:supabase_hackathon/views/authentication/registration.dart';

import '../../constants/showLoader.dart';
import '../../constants/textFieldLoginView.dart';
import '../../routes/app.routes.dart';
import '../home/homeScreen.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
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

    signUpUser(String giveEmail, String givePassword) async {
      // loadNow.isLoading(true);

      // Loader().showLoaderNow(context);

      String emailIs = giveEmail;
      String passwordIS = givePassword;

      print(emailIs.toString() + "   ===");
      print(passwordIS.toString() + "   ===");

      // await Navigator.pushNamed(
      //   context,
      //   AppRoutes.registrationRoute,
      //   arguments: {'email': emailIs, 'password': passwordIS},
      // );

      final result = await authenticationNotifier.signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );

      if (result != null) {
        try {} catch (err) {
          log(err.toString());
        }
      }

      setState(() {});

      // await Navigator.pushNamed(AppRoutes.registrationRoute, arguments: [
      //   emailIs,
      //   passwordIS,
      // ]);

      // if (emailIs.isEmpty && passwordIS.isEmpty) {
      //   log("Please provide all details ");
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text("Please provide all details"),
      //       backgroundColor: primaryColor,
      //     ),
      //   );
      // } else {
      //   loadNow.load == true
      //       ? Loader().showLoaderNow(context)
      //       : const SizedBox();
      //   await authenticationNotifier.signUp(
      //     email: emailIs,
      //     password: passwordIS,
      //     context: context,
      //   );

      //   context.read<AuthSuccessProvider>().authSuccess == true
      //       ? Navigator.of(context).pushNamed(AppRoutes.registrationRoute)
      //       : Navigator.pop(context);

      //   // Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);

      //   loadNow.isLoading(false);
      // }

      // Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "StoreIt SignUp",
            style: TextStyle(color: primaryColor),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: nameController,
                hintText: "Enter Full Name",
              ),
              TextFieldWidget(
                controller: emailController,
                hintText: "Enter email",
              ),
              TextFieldWidget(
                controller: passwordController,
                hintText: "Enter password",
              ),
              TextFieldWidget(
                controller: confirmPasswordController,
                hintText: "Confirm password",
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty) {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      await signUpUser(
                          emailController.text, passwordController.text);

                      // if (response != null) {
                      //   authenticationNotifier.addUserToDatabase(city: city);
                      // }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter correct password"),
                          backgroundColor: primaryColor,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please provide all details"),
                        backgroundColor: primaryColor,
                      ),
                    );
                  }
                  // emailController.clear();
                  // passwordController.clear();
                },
                child: const Text("SignUp"),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.loginRoute);
                  },
                  child: const Text(
                    "Already have an account? Login!",
                    style: TextStyle(color: Colors.grey),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
