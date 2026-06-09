class FeedbackState {
  final String name;
  final String email;
  final String contact;
  final String issueTitle;
  final String description;
  final String? imagePath;
  final String? videoPath;
  final String? filePath;

  const FeedbackState({
    this.name = '',
    this.email = '',
    this.contact = '',
    this.issueTitle = '',
    this.description = '',
    this.imagePath,
    this.videoPath,
    this.filePath,
  });

  FeedbackState copyWith({
    String? name,
    String? email,
    String? contact,
    String? issueTitle,
    String? description,
    String? imagePath,
    String? videoPath,
    String? filePath,
  }) {
    return FeedbackState(
      name: name ?? this.name,
      email: email ?? this.email,
      contact: contact ?? this.contact,
      issueTitle: issueTitle ?? this.issueTitle,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      videoPath: videoPath ?? this.videoPath,
      filePath: filePath ?? this.filePath,
    );
  }
}