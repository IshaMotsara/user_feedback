import 'package:feedback_application/blocs/feedback/fedback_cubit.dart';
import 'package:feedback_application/screens/media_screen.dart';
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

            TextFormField(
              controller: issueTitleController,
              decoration: const InputDecoration(
                hintText: "Enter issue title",
                border: OutlineInputBorder(),
              ),
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

            TextFormField(
              controller: descriptionController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText:
                    "Describe the bug or issue in detail...",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
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
                child: const Text(
                  "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}