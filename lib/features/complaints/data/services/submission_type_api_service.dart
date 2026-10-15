
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/submission_type_model.dart';

class SubmissionTypeApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<List<SubmissionTypeModel>> getSubmissionTypes() async {
    final uri = Uri.parse('$baseUrl/submission-types');

    try {
      debugPrint('Submission Types URL: $uri');

      final response = await http
          .get(uri)
          .timeout(const Duration(seconds: 20));

      debugPrint(
        'Submission Types Status: ${response.statusCode}',
      );
      debugPrint(
        'Submission Types Response: ${response.body}',
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to load submission types: ${response.statusCode}',
        );
      }

      final decoded = jsonDecode(response.body);

      if (decoded is! Map<String, dynamic> ||
          decoded['data'] is! List) {
        throw const FormatException(
          'Unexpected submission types response format',
        );
      }

      final data = decoded['data'] as List;

      return data
          .map(
            (item) => SubmissionTypeModel.fromJson(
          Map<String, dynamic>.from(item as Map),
        ),
      )
          .toList();
    } catch (e, stackTrace) {
      debugPrint('Submission Types API Error: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
