class SubmissionTypeModel {
  final String id;
  final String nameEn;
  final String nameAr;

  const SubmissionTypeModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  factory SubmissionTypeModel.fromJson(Map<String , dynamic>json){
    return SubmissionTypeModel(
        id: json ['id'].toString(),
        nameEn: json['nameEn']?? '',
        nameAr: json['nameAr']?? ''
    );
  }
}
