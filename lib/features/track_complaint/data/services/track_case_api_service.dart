import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/case_model.dart';

class TrackCaseApiService {
  static const String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<CaseModel?> trackCase({
    required String referenceNumber,
    required String contact,
    String? crNumber,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/track-case'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'referenceNumber': referenceNumber,
        'contact': contact,
        'crNumber': crNumber ?? '',
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
      jsonDecode(response.body);

      return CaseModel.fromJson(data);
    }

    return null;
  }
}