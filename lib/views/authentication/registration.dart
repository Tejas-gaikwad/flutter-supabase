import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_hackathon/constants/constant.dart';
import 'package:supabase_hackathon/credentials/supabase.creds.dart';
import 'package:supabase_hackathon/providers/loadingProvider.dart';
import '../../constants/showLoader.dart';
import '../../constants/textFieldLoginView.dart';
import '../../main/Notifier/authentication.notifier.dart';
import '../../providers/authSuccessProvider.dart';
import '../../routes/app.routes.dart';

class Registration extends StatefulWidget {
  final email;
  final password;
  const Registration({
    super.key,
    this.email,
    this.password,
  });

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late TextEditingController userNameController;
  late TextEditingController mobileNumberController;
  late TextEditingController cityController;
  late TextEditingController countryController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.email);
    print(widget.password);
    userNameController = TextEditingController();
    mobileNumberController = TextEditingController();
    cityController = TextEditingController();
    countryController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);

    final LoadingProvider loadNow =
        Provider.of<LoadingProvider>(context, listen: false);

    final bool authSuccess =
        Provider.of<AuthSuccessProvider>(context).authSuccess;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    signUpUser() async {
      loadNow.isLoading(true);

      Loader().showLoaderNow(context);

      setState(() {});

      // await Navigator.pushNamed(AppRoutes.registrationRoute, arguments: [
      //   emailIs,
      //   passwordIS,
      // ]);

      loadNow.load == true ? Loader().showLoaderNow(context) : const SizedBox();
      final result = await authenticationNotifier.signUp(
        email: arguments['email'].toString(),
        password: arguments['password'].toString(),
        context: context,
      );

      log(result.toString() + "  Registration view");

      // if (result != null) {
      //   try {
      //     await SupaBaseCredentials.sbClient.from('UsersDatabase').insert({
      //       'userName': userNameController.text,
      //       'email': widget.email,
      //       'mobileNumber': mobileNumberController.text,
      //       'userId': result.data!.user!.id
      //     }).execute();

      //     setState(() {});
      //   } catch (error) {
      //     throw Exception(error);
      //   }
      // }

      // context.read<AuthSuccessProvider>().authSuccess == true
      //     ? Navigator.of(context).pushNamed(AppRoutes.registrationRoute)
      //     : Navigator.pop(context);

      // Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);

      loadNow.isLoading(false);

      Navigator.pop(context);
    }

    print(arguments.toString());
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Registration",
            style: TextStyle(color: primaryColor),
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arguments['email'].toString()),
            // Text(widget.password.toString()),
            TextFieldWidget(
              controller: userNameController,
              hintText: "Full name",
            ),
            TextFieldWidget(
              controller: mobileNumberController,
              hintText: "Mobile Number",
            ),
            TextFieldWidget(
              controller: cityController,
              hintText: "City",
            ),
            TextFieldWidget(
              controller: countryController,
              hintText: "Country",
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
                await signUpUser();
                // try {
                //   await SupaBaseCredentials.sbClient.from('Users').insert({
                //     'name': userNameController.text,
                //     'email': emailController.text,
                //     'phone': mobileNumberController.text,
                //     'userId': result.data!.user!.id
                //   }).execute();

                //   setState(() {});
                // } catch (e) {
                //   throw Exception(e);
                // }

                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text("Account Created Successfully"),
                // ));
                // Navigator.pushNamedAndRemoveUntil(
                //     context, AppRoutes.homeScreenRoute, (route) => false);
              },
              // else if (result.error != null) {
              //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(result.error!.message),
              //   ));

              //           },
              child: Container(
                padding: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity / 2,
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Text("Submit")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
