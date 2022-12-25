import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_hackathon/providers/app.provider.dart';
import 'package:supabase_hackathon/routes/app.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MainFile(),
    );
  }
}

class MainFile extends StatelessWidget {
  const MainFile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.loginRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
