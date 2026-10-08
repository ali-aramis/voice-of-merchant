class CaseModel {
  final String referenceNumber;
  final String status;
  final String entity;
  final String subject;
  final String submittedAt;

  CaseModel({
    required this.referenceNumber,
    required this.status,
    required this.entity,
    required this.subject,
    required this.submittedAt,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      referenceNumber: json['referenceNumber'] ?? '',
      status: json['status'] ?? '',
      entity: json['entity'] ?? '',
      subject: json['subject'] ?? '',
      submittedAt: json['submittedAt'] ?? '',
    );
  }
}