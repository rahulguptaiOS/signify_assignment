import 'dart:convert';
import 'dart:io';

import 'package:signify_assignment/data/models/quote_model.dart';

class FileHandler {
  static Future<List<QuoteModel>> readJsonFile(String filePath) async {
    try {
      // Read the JSON file as a string
      String jsonString = await File(filePath).readAsString();
      var jsonData = json.decode(jsonString);
      return jsonData;
    } catch (e) {
      print('Error reading JSON file: $e');
      return [];
    }
  }

}