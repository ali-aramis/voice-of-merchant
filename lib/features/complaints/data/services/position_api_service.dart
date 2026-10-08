import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/position_model.dart';

class PositionApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<List<PositionModel>> getPositions() async {
    final response = await http.get(
      Uri.parse('$baseUrl/positions'),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load positions: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body);

    return (json['data'] as List)
        .map(
          (item) => PositionModel.fromJson(item),
    )
        .toList();
  }
}