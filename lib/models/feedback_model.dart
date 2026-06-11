class FeedbackModel {
  int? id;
  String name;
  String email;
  String contact;
  String description;
  String? imagePath;
  String? videoPath;
  String issueTitle;
  String? filePath;
  

  FeedbackModel({
    this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.description,
    this.imagePath,
    this.videoPath,
    required this.issueTitle,
    this.filePath,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'contact': contact,
      'description': description,
      'imagePath': imagePath,
      'videoPath': videoPath,
      'issueTitle': issueTitle,
      'filePath': filePath,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      contact: map['contact'],
      description: map['description'],
      imagePath: map['imagePath'],
      videoPath: map['videoPath'],
       issueTitle: map['issueTitle'],
       filePath: map['filePath'],
        

    );
  }
}