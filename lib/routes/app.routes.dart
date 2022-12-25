import 'package:supabase_hackathon/views/authentication/signUp.view.dart';
import 'package:supabase_hackathon/views/home/homeScreen.dart';
import '../views/authentication/login.view.dart';
import '../views/authentication/registration.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";
  static const String homeScreenRoute = "/homescreen";
  static const String registrationRoute = "/registration";
  static final routes = {
    loginRoute: (context) => const Loginview(),
    signUpRoute: (context) => const SignUpView(),
    homeScreenRoute: (context) => const HomeScreen(),
    registrationRoute: (context) => const Registration(),
  };
}
