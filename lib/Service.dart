// ignore: file_names
import 'dart:convert';
import 'package:flutter/services.dart';

class ExamService {
  static Future<List<Map<String, dynamic>>> getQuestions(arguments) async {
    try {
      // Load JSON data from the file
      String jsonData =
          await rootBundle.loadString('assets/db/$arguments.json');

      // Decode the JSON string
      List<Map<String, dynamic>> questions =
          jsonDecode(jsonData).cast<Map<String, dynamic>>();

      return questions;
    } catch (e) {
      // Handle any errors that might occur during the process
      print('Error loading questions: $e');
      return [];
    }
  }
}
