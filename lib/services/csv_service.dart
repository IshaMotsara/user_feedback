import 'dart:io';

import 'package:csv/csv.dart';

import 'database_service.dart';

class CsvService {
  static Future<String> exportFeedback() async {
    final data = await DatabaseService.getAllFeedback();

    List<List<dynamic>> rows = [];

    rows.add([
      'Device Owner',
      'Name',
      'Email',
      'Contact',
      'Issue Title',
      'Description',
      'Image Path',
      'Video Path',
      'File Path',
    ]);

    for (var item in data) {
      rows.add([
        'Google Owner',
        item['name'],
        item['email'],
        item['contact'],
        item['issueTitle'],
        item['description'],
        item['imagePath'],
        item['videoPath'],
        item['filePath'],
      ]);
    }

    String csvData =
        const ListToCsvConverter().convert(rows);

    Directory downloadsDir =
        Directory('/storage/emulated/0/Download');

    final file = File(
      '${downloadsDir.path}/feedback_export.csv',
    );

    await file.writeAsString(csvData);

    return file.path;
  }
}