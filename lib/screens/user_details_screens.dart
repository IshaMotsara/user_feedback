import 'package:feedback_application/blocs/feedback/fedback_cubit.dart';
import 'package:feedback_application/screens/bug_description_screen.dart';
import 'package:feedback_application/widgets/common_button.dart';
import 'package:feedback_application/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController contactController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Details"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Padding(
          padding: const EdgeInsets.all(20),
        
          child: Column(
            children: [
        
              CommonTextField(
            controller: nameController,
            label: "Name",
            keyboardType: TextInputType.name,
          ),
        
          const SizedBox(height: 16),
        
          CommonTextField(
            controller: emailController,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
        
          const SizedBox(height: 16),
        
          CommonTextField(
            controller: contactController,
            label: "Contact Number",
            keyboardType: TextInputType.phone,
          ),
        
        
              const SizedBox(height: 30),
        
              SizedBox(
                width: double.infinity,
                child: CommonButton(
                  text:"Next",
                  onPressed: () {
        
                    context.read<FeedbackCubit>().updateUserDetails(
            name: nameController.text,
            email: emailController.text,
            contact: contactController.text,
          );
        
          final state = context.read<FeedbackCubit>().state;
        
          print("NAME = ${state.name}");
          print("EMAIL = ${state.email}");
          print("CONTACT = ${state.contact}");
        
          Navigator.push(
            context,
            MaterialPageRoute(
        builder: (context) => const BugDescriptionScreen(),
            ),
          );
                    // Navigate to Bug Description Screen
                  },
                  
                ),
              ),
            ],
          ),
        ),],
      ),
    );
  }
}