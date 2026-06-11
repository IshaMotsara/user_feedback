# Feedback Application

A Flutter-based Feedback Management Application that allows users to submit feedback along with images, videos, and files. The application stores feedback locally using SQLite and provides secure CSV export functionality protected by biometric authentication.

## Features

### User Details
- Enter Name
- Enter Email
- Enter Contact Number

### Bug/Issue Reporting
- Enter Issue Title
- Enter Detailed Description

### Media Attachments
- Select Image from Gallery
- Select Video from Gallery
- Select File from Device Storage

### Local Storage
- Stores feedback data locally using SQLite database
- Saves:
  - User Details
  - Issue Information
  - Image Path
  - Video Path
  - File Path

### CSV Export
- Export all feedback records to CSV
- CSV file is stored in the device Download folder
- Includes:
  - Device Owner
  - User Details
  - Issue Information
  - Media/File Paths

### Security
- Biometric Authentication


### State Management
- Implemented using Flutter Bloc (Cubit)

### Firebase Authentication
- Google Sign-In Authentication
- Firebase Integration

## Tech Stack

### Frontend
- Flutter
- Dart

### State Management
- Flutter Bloc (Cubit)

### Database
- SQLite (sqflite)

### Authentication
- Firebase Authentication
- Google Sign-In
- Local Authentication (Biometrics)

### File Handling
- File Picker
- Image Picker
- CSV Export

## Packages Used

```yaml
flutter_bloc
firebase_core
firebase_auth
google_sign_in
sqflite
path
path_provider
image_picker
file_picker
csv
local_auth
```

## Project Structure

```
lib/
├── blocs/
├── models/
├── screens/
├── services/
├── widgets/
├── firebase_options.dart
└── main.dart
```

## Workflow

1. User signs in using Google Authentication.
2. User enters personal details.
3. User submits issue title and description.
4. User attaches media/files.
5. Feedback data is stored locally in SQLite.
6. User exports feedback data as CSV.
7. Biometric authentication is required before export.
8. CSV file is saved in the Download folder.

## Future Enhancements

- Cloud Storage Integration
- Firebase Firestore Support
- Admin Dashboard
- PDF Report Generation
- Feedback Analytics
- Attachment Preview

## Author

Developed using Flutter and Firebase.
