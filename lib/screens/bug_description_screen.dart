import 'package:feedback_application/blocs/feedback/fedback_cubit.dart';
import 'package:feedback_application/screens/media_screen.dart';
import 'package:feedback_application/widgets/common_button.dart';
import 'package:feedback_application/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BugDescriptionScreen extends StatefulWidget {
  const BugDescriptionScreen({super.key});

  @override
  State<BugDescriptionScreen> createState() =>
      _BugDescriptionScreenState();
}

class _BugDescriptionScreenState
    extends State<BugDescriptionScreen> {

  final TextEditingController issueTitleController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  @override
  void dispose() {
    issueTitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bug Description"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Issue Title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            CommonTextField(
              controller: issueTitleController,
              label:"Enter issue title",
            ),

            const SizedBox(height: 20),

            const Text(
              "Detailed Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            CommonTextField(
              controller: descriptionController,
              maxLines: 6,
              label:"Describe the bug or issue in detail...",
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: CommonButton(
                text:"Next",
                onPressed: () {
                  final state = context.read<FeedbackCubit>().state;

               context.read<FeedbackCubit>().updateBugDescription(
               issueTitle: issueTitleController.text,
                description: descriptionController.text,
                );
                final state1 = context.read<FeedbackCubit>().state;
                print("ISSUE TITLE = ${state.issueTitle}");
                print("DESCRIPTION = ${state.description}");

                  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MediaScreen(),
        ),
      );

                  // Navigate to Media Collection Screen
                },
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}