import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:team_project_final/models/caption.dart';

class CaptionImageServices {
  static Future<ImageCaption> imageCaption({required File caption}) async {
    final request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://4950-102-42-160-33.ngrok-free.app/generate_caption'));

    // Add the image file as a multipart/form-data field
    final file = await http.MultipartFile.fromPath('file', caption.path);
    request.files.add(file);

    final response = await request.send().timeout(const Duration(minutes: 2));
    if (response.statusCode == 200) {
      print("image uploaded");
    } else {
      print("***** ERROR${response.statusCode}");
    }
    final responseBody = await response.stream.bytesToString();
    return ImageCaption.fromjson(jsonDecode(responseBody));

    // Error occurred while uploading image
  }
}
