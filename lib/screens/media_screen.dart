import 'package:feedback_application/blocs/feedback/fedback_cubit.dart';
import 'package:feedback_application/models/feedback_model.dart';
import 'package:feedback_application/services/database_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {

  
  // Variables
  File? selectedImage;
  File? selectedVideo;
  String? selectedFilePath;

  final ImagePicker picker = ImagePicker();
  
  
  
  
  
  // Pick Image
  Future<void> pickImage() async {
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });

      context.read<FeedbackCubit>().updateMedia(
  imagePath: image.path,
  videoPath: selectedVideo?.path,
  filePath: selectedFilePath,
);

print(image.path);
    }
  }

  // Pick Video
  Future<void> pickVideo() async {
    final XFile? video =
        await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        selectedVideo = File(video.path);
      });

      
      
      context.read<FeedbackCubit>().updateMedia(
  imagePath: selectedImage?.path,
  videoPath: video.path,
  filePath: selectedFilePath,
);

print(video.path);
    }
  }

  // Pick File
  Future<void> pickFile() async {
  FilePickerResult? result = await FilePicker.pickFiles();

  if (result != null) {
    String? filePath = result.files.single.path;

    setState(() {
      selectedFilePath = filePath;
    });

    context.read<FeedbackCubit>().updateMedia(
  imagePath: selectedImage?.path,
  videoPath: selectedVideo?.path,
  filePath: filePath,
);

print(filePath);
  }
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBar(
        title: const Text("Media Screen"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: pickImage,
                child: const Text("Select Image"),
              ),
        
              ElevatedButton(
                onPressed: pickVideo,
                child: const Text("Select Video"),
              ),
        
              ElevatedButton(
                onPressed: pickFile,
                child: const Text("Select File"),
              ),
        
                if (selectedImage != null)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.file(
        selectedImage!,
        height: 150,
        width: 150,
        fit: BoxFit.cover,
            ),
          ),
        
        if (selectedVideo != null)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
        "Video Selected:\n${selectedVideo!.path}",
        textAlign: TextAlign.center,
            ),
          ),
        
        if (selectedFilePath != null)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
        "File Selected:\n$selectedFilePath",
        textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: ()async{
            final state = context.read<FeedbackCubit>().state;

    print("NAME = ${state.name}");
    print("EMAIL = ${state.email}");
    print("CONTACT = ${state.contact}");
    print("ISSUE = ${state.issueTitle}");
    print("DESCRIPTION = ${state.description}");
    print("IMAGE = ${state.imagePath}");
    print("VIDEO = ${state.videoPath}");
    print("FILE = ${state.filePath}");

    await DatabaseService.insertFeedback(
  FeedbackModel(
    name: state.name,
    email: state.email,
    contact: state.contact,
    issueTitle: state.issueTitle,
    description: state.description,
    imagePath: state.imagePath,
    videoPath: state.videoPath,
    filePath: state.filePath,
  ).toMap(),
);

              
            }, 
            child: Text('submit'),
            ),
              
            ],
          ),
        ),
      ),

    );
  }
}