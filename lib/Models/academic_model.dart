class AcademicSessionModel {
  final int id;
  final String createdAt;
  final String description;
  final String endDate;
  final String isDefault;
  final String name;
  final String options;
  final String startDate;
  final String updatedAt;

  AcademicSessionModel(
    this.id,
    this.createdAt,
    this.description,
    this.endDate,
    this.isDefault,
    this.name,
    this.options,
    this.startDate,
    this.updatedAt,
  );

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "createdAt": this.createdAt,
      "description": this.description,
      "endDate": this.endDate,
      "isDefault": this.isDefault,
      "name": this.name,
      "options": this.options,
      "startDate": this.startDate,
      "updatedAt": this.updatedAt,
    };
  }
}
