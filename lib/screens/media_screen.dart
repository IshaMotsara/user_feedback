import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
              
            ],
          ),
        ),
      ),

    );
  }
}