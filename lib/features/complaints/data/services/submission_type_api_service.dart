import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/submission_type_model.dart';

class SubmissionTypeApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<List<SubmissionTypeModel>> getSubmissionTypes() async {
    final response = await http.get(
      Uri.parse('$baseUrl/submission-types'),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load submission types: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body);

    return (json['data'] as List)
        .map(
          (item) => SubmissionTypeModel.fromJson(item),
    )
        .toList();
  }
}