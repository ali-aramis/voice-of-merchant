class EntityModel {
  final String id;
  final String nameEn;
  final String nameAr;

  const EntityModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  factory EntityModel.fromJson(Map<String, dynamic> json) {
    return EntityModel(
      id: json['id'].toString(),
      nameEn: json['nameEn'] ?? '',
      nameAr: json['nameAr'] ?? '',
    );
  }
}