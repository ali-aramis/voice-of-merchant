import 'package:flutter/foundation.dart';

import 'data/models/case_model.dart';
import 'data/services/track_case_api_service.dart';

class TrackCaseController extends ChangeNotifier {
  final TrackCaseApiService _apiService = TrackCaseApiService();

  bool _isLoading = false;
  CaseModel? _case;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  CaseModel? get caseData => _case;
  String? get errorMessage => _errorMessage;

  Future<void> trackCase({
    required String referenceNumber,
    required String contact,
    String? crNumber,
    required String unableToFindCaseMessage,
    required String somethingWentWrongMessage,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _case = null;

    notifyListeners();

    try {
      _case = await _apiService.trackCase(
        referenceNumber: referenceNumber,
        contact: contact,
        crNumber: crNumber,
      );

      if (_case == null) {
        _errorMessage = unableToFindCaseMessage;
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }
}