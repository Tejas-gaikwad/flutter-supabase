import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:supabase_hackathon/credentials/supabase.creds.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getData() async {
    final data =
        await SupaBaseCredentials.sbClient.from("UsersDatabase").insert({
      'id': '110ec58a-a0f2-4ac4-8393-c866d813b841',
      'created_at': DateTime.now().toString(),
      'userName': 'The Shire',
      'mobileNumber': '1236587490',
      'city': 'pune',
      'country': 'india',
      'email': 'tejasgaikwad@gmail.com'
    });
    print("Data is ...    " + data.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: const [
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
