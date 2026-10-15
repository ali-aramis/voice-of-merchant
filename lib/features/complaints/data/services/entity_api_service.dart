
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/entity_model.dart';

class EntityApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<List<EntityModel>> getEntities() async {
    final uri = Uri.parse('$baseUrl/entities');

    debugPrint('Entities API URL: $uri');

    final response = await http
        .get(uri)
        .timeout(const Duration(seconds: 20));

    debugPrint('Entities API status: ${response.statusCode}');
    debugPrint('Entities API response: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load entities: ${response.statusCode}',
      );
    }

    final decoded = jsonDecode(response.body);

    if (decoded is! Map<String, dynamic> ||
        decoded['data'] is! List) {
      throw FormatException(
        'Unexpected entities API response format',
      );
    }

    final data = decoded['data'] as List;

    return data
        .map(
          (item) => EntityModel.fromJson(
        Map<String, dynamic>.from(item as Map),
      ),
    )
        .toList();
  }
}
