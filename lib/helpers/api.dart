import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post({
    required String url,
    @required dynamic body,
  }) async {
    http.Response response = await http.post(Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json"
        }).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
      
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    return data;
  }
}
// class Api {
//   Future<dynamic> post({
//     required String url,
//     required Map<String, dynamic> body,
//   }) async {
//     http.Response response = await http.post(Uri.parse(url),
//         headers: {
//           "Content-Type": "multipart/form-data",
//           "Accept": "application/json"
//         },
//         body: body);
//     Map<String, dynamic> data = jsonDecode(response.body);

//     return data;
//   }
// }