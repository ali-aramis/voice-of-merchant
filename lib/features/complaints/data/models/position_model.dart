class PositionModel {
  final String id;
  final String nameEn;
  final String nameAr;

  const PositionModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      id: json['id'].toString(),
      nameEn: json['nameEn'] ?? '',
      nameAr: json['nameAr'] ?? '',
    );
  }
}