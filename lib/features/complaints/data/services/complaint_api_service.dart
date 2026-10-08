import 'dart:convert';
import 'package:http/http.dart' as http;

class ComplaintApiService {
  final String baseUrl =
      'https://41c5d05c-fc67-45e9-8655-00498a2549de.mock.pstmn.io';

  Future<String> submitComplaint({
    required String submissionType,
    required String entity,
    required String fullName,
    required String email,
    required String phone,
    required String idNumber,
    required String position,
    required String companyName,
    required String crNumber,
    required String bcciMembership,
    required String subject,
    required String description,
    required bool consent,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/complaints'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'submissionType': submissionType,
        'entity': entity,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'idNumber': idNumber,
        'position': position,
        'companyName': companyName,
        'crNumber': crNumber,
        'bcciMembership': bcciMembership,
        'subject': subject,
        'description': description,
        'consent': consent,
      }),
    );


    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(
        'Failed to submit complaint: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body);


    return json['data']['complaintId'].toString();
  }
}