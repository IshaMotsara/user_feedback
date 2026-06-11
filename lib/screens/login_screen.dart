import 'package:feedback_application/screens/user_details_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
//make changes

class _LoginScreenState extends State<LoginScreen> {

  Future<bool> login() async {
  try {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn();

    if (googleUser == null) {
      return false; // User cancelled sign-in
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.idToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    return FirebaseAuth.instance.currentUser != null;
  } catch (e) {
    print("Google Sign-In Error: $e");
    return false;
  }
}
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
                        onPressed: () async{

                          bool isLogged = await login();
                          if(isLogged){
                         Navigator.push(
                         context,
                         MaterialPageRoute(
                         builder: (_) => UserDetailsScreen(),
                       ),
                      );
                     }},
                   child: const Text("Sign in with Google"),
                  ),
            
          ],
        ),
      ),
    );
  }
}