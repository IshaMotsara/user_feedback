import 'package:feedback_application/screens/user_details_screens.dart';
import 'package:feedback_application/widgets/common_button.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Thank You"),
      ),
      body:  Center(
        child: CommonButton(
          text: "Thank You",
          onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
        builder: (context) => const UserDetailsScreen(),
            ));
        },
        
        
        )
      ),
    );
  }
}