import 'package:feedback_application/screens/user_details_screens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
//make changes

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('lib/assets/images/image_1.json'),
               ElevatedButton(
                        onPressed: () {
                         Navigator.push(
                         context,
                         MaterialPageRoute(
                         builder: (_) => UserDetailsScreen(),
                       ),
                      );
                     },
                   child: const Text("Sign in with Google"),
                  ),
            
          ],
        ),
      ),
    );
  }
}