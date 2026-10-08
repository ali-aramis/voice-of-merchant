import 'package:flutter/material.dart';
import 'package:vom/features/complaints/data/models/entity_model.dart';

import '../data/models/submission_type_model.dart';
import '../data/services/complaint_api_service.dart';
import '../data/services/position_api_service.dart';
import '../data/services/entity_api_service.dart';
import '../data/services/submission_type_api_service.dart';

import '../data/models/position_model.dart';
class ComplaintFormController extends ChangeNotifier {
// ============================================================
// 1. API SERVICES
// ============================================================
// These classes are responsible for communicating with APIs.

  final EntityApiService _entityApiService = EntityApiService();

  final SubmissionTypeApiService _submissionTypeApiService =
      SubmissionTypeApiService();

  final PositionApiService _positionApiService =
  PositionApiService();

  final ComplaintApiService _complaintApiService =
  ComplaintApiService();

// ============================================================
// 2. API DATA
// ============================================================
// These lists store the data received from APIs.

// Entity API data
  List<EntityModel> entities = [];

// Submission Type API data
  List<SubmissionTypeModel> submissionTypes = [];

  // Position Type API data
  List<PositionModel> positions = [];

// ============================================================
// 3. FORM CONFIGURATION
// ============================================================
// Our complaint form contains 5 steps.

  static const int stepCount = 5;

  final List<GlobalKey<FormState>> formKeys = List.generate(
    stepCount,
    (_) => GlobalKey<FormState>(),
  );

// ============================================================
// 4. SELECTED VALUES — STEP 1
// ============================================================
// These variables store what the user selects from dropdowns.

  String? submissionType;

  String? entity;

  String? position;

// ============================================================
// 5. TEXT FIELDS — STEP 2
// ============================================================
// Personal Information

  final fullName = TextEditingController();

  final email = TextEditingController();

  final phone = TextEditingController();

  final idNumber = TextEditingController();

// ============================================================
// 6. TEXT FIELDS — STEP 3
// ============================================================
// Company Information

  final companyName = TextEditingController();

  final crNumber = TextEditingController();

  final bcciMembership = TextEditingController();

// ============================================================
// 7. TEXT FIELDS — STEP 4
// ============================================================
// Case Details

  final subject = TextEditingController();

  final description = TextEditingController();

  final suggestionSummary = TextEditingController();

  final requestedResolution = TextEditingController();

// ============================================================
// 8. CONSENT — STEP 5
// ============================================================

  bool consent = false;

// ============================================================
// 9. STEP / FORM STATE
// ============================================================
// Keeps track of which step the user is currently viewing.

  int _step = 0;

  bool _isSubmitting = false;

  bool _disposed = false;

  int get step => _step;

  bool get isSubmitting => _isSubmitting;

  bool get isFirst => _step == 0;

  bool get isLast => _step == stepCount - 1;
  bool consentValidationAttempted = false;
// ============================================================
// 10. CONTROLLER CONSTRUCTOR
// ============================================================
// When the controller is created, both APIs are loaded.

  ComplaintFormController() {
    loadEntities();
    loadSubmissionTypes();
    loadPositions();
  }

// ============================================================
// 11. ENTITY API
// ============================================================
// Gets entities from the backend API.

  Future<void> loadEntities() async {
    try {
// Call Entity API
      entities = await _entityApiService.getEntities();

      debugPrint(
        'Entities loaded: ${entities.length}',
      );

// Print entities for debugging
      for (final entity in entities) {
        debugPrint(
          'Entity: id=${entity.id}, name=${entity.nameEn}',
        );
      }

// Tell UI that new data has arrived
      notifyListeners();
    } catch (e) {
      debugPrint(
        'Failed to load entities: $e',
      );
    }
  }

// ============================================================
// 12. SUBMISSION TYPE API
// ============================================================
// Gets submission types from the backend API.

  Future<void> loadSubmissionTypes() async {
    try {
// Call Submission Type API
      submissionTypes = await _submissionTypeApiService.getSubmissionTypes();

// Tell UI that new data has arrived
      notifyListeners();
    } catch (e) {
      debugPrint(
        'Failed to load submission types: $e',
      );
    }
  }
// ============================================================
// 12. Position TYPE API
// ============================================================
  Future<void> loadPositions() async {
    try {
      positions = await _positionApiService.getPositions();

      debugPrint('Positions loaded: ${positions.length}');

      for (final position in positions) {
        debugPrint(
          'Position: id=${position.id}, name=${position.nameEn}',
        );
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load positions: $e');
    }
  }

// ============================================================
// 13. STEP NAVIGATION
// ============================================================
// Moves the user to the next step.

  Future<String?> next() async {
    final valid = formKeys[_step].currentState?.validate() ?? false;

    if (!valid) return null;

    if (isLast) {
      consentValidationAttempted = true;
      notifyListeners();

      if (!consent) {
        return null;
      }

      return await submit();
    }

    _step++;
    notifyListeners();

    return null;
  }

// Moves the user to the previous step.

  void back() {
    if (isFirst) return;

    _step--;

    notifyListeners();
  }

// ============================================================
// 14. USER SELECTIONS
// ============================================================
// Called when user selects Submission Type.

  void setSubmissionType(String? value) {
    submissionType = value;

    notifyListeners();
  }

// Called when user selects Entity.

  void setEntity(String? value) {
    entity = value;

    notifyListeners();
  }

// Called when user selects Position.

  void setPosition(String? value) {
    position = value;

    notifyListeners();
  }

// Called when user changes Consent checkbox.

  void setConsent(bool value) {
    consent = value;

    if (value) {
      consentValidationAttempted = false;
    }

    notifyListeners();
  }

  // helper getters
  String get selectedSubmissionTypeName {
    for (final type in submissionTypes) {
      if (type.id == submissionType) {
        return '${type.nameEn} / ${type.nameAr}';
      }
    }

    return '-';
  }
  String? get consentError {
    if (!consent) {
      return 'Please confirm that the information is accurate and complete.';
    }

    return null;
  }

  String get selectedEntityName {
    for (final item in entities) {
      if (item.id.toString() == entity) {
        return '${item.nameEn} / ${item.nameAr}';
      }
    }

    return '-';
  }

// ============================================================
// 15. SUBMIT FORM
// ============================================================
// Currently this is still a mock submission.
// Later we can replace this with a real POST API.
  Future<String?> submit() async {
    _isSubmitting = true;

    notifyListeners();

    try {
      final complaintId = await _complaintApiService.submitComplaint(
        submissionType: submissionType ?? '',
        entity: entity ?? '',
        fullName: fullName.text,
        email: email.text,
        phone: phone.text,
        idNumber: idNumber.text,
        position: position ?? '',
        companyName: companyName.text,
        crNumber: crNumber.text,
        bcciMembership: bcciMembership.text,
        subject: subject.text,
        description: description.text,
        consent: consent,
      );

      debugPrint('Complaint submitted: $complaintId');

      return complaintId;
    } catch (e) {
      debugPrint('Complaint submission failed: $e');
      return null;
    } finally {
      if (!_disposed) {
        _isSubmitting = false;
        notifyListeners();
      }
    }
  }

// ============================================================
// 16. DISPOSE
// ============================================================
// Releases TextEditingController resources.

  @override
  void dispose() {
    _disposed = true;

    fullName.dispose();

    email.dispose();

    phone.dispose();

    idNumber.dispose();

    companyName.dispose();

    crNumber.dispose();

    bcciMembership.dispose();

    subject.dispose();

    description.dispose();

    suggestionSummary.dispose();
    requestedResolution.dispose();

    super.dispose();
  }
}
