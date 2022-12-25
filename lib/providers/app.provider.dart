import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supabase_hackathon/main/Notifier/authentication.notifier.dart';
import 'package:supabase_hackathon/providers/authSuccessProvider.dart';
import 'package:supabase_hackathon/providers/loadingProvider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => LoadingProvider()),
    ChangeNotifierProvider(create: (_) => AuthSuccessProvider()),
  ];
}
