import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/entity_model.dart';

class EntityApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<List<EntityModel>> getEntities() async {
    final response = await http.get(
      Uri.parse('$baseUrl/entities'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);

    return (json['data'] as List)
        .map((item) => EntityModel.fromJson(item))
        .toList();
  }
}
