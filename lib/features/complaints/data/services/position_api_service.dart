import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/position_model.dart';

class PositionApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<List<PositionModel>> getPositions() async {
    final uri = Uri.parse('$baseUrl/positions');

    try {
      debugPrint('Positions API URL: $uri');

      final response = await http
          .get(uri)
          .timeout(const Duration(seconds: 20));

      debugPrint('Positions API Status: ${response.statusCode}');
      debugPrint('Positions API Response: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to load positions: ${response.statusCode}',
        );
      }

      final decoded = jsonDecode(response.body);

      if (decoded is! Map<String, dynamic> ||
          decoded['data'] is! List) {
        throw const FormatException(
          'Unexpected positions API response format',
        );
      }

      final data = decoded['data'] as List;

      return data
          .map(
            (item) => PositionModel.fromJson(
          Map<String, dynamic>.from(item as Map),
        ),
      )
          .toList();
    } catch (e, stackTrace) {
      debugPrint('Positions API Error: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}