import 'package:flutter/material.dart';
import 'package:sdstudio/pages/main_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage();

    // StreamBuilder<User?>(
    //   stream:FirebaseAuth.instance
    //   builder:
    // );

    // Scaffold(
    //   body: Builder(
    //     builder: (BuildContext context) {
    //       return const HomePage();
    //     },
    //   ),
    // );
  }
}
