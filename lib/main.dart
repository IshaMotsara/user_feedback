import 'package:feedback_application/blocs/feedback/fedback_cubit.dart';
import 'package:feedback_application/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    BlocProvider(
      create: (_) => FeedbackCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  scaffoldBackgroundColor: const Color(0xFFFFF8FA),

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFFFD6E7),
    brightness: Brightness.light,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(137, 250, 238, 242),
    foregroundColor: Colors.black87,
    centerTitle: true,
    elevation: 0,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFE4EC),
      foregroundColor: Colors.black87,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Color(0xFFFFB6C1),
        width: 2,
      ),
    ),
  ),
),
      home: const LoginScreen(),
    );
  }
}