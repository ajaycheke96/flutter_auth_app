import 'package:flutter_auth_app/Models/student_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dues_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DueModel {
  DueDetailModel? dueDetails;
  List<InvoiceReceiptModel>? invoiceReceipts;
  StudentRecordModel? studentRecord;

  DueModel({
    this.dueDetails,
    this.invoiceReceipts,
    this.studentRecord,
  });

  factory DueModel.fromJson(Map<String, dynamic> json) =>
      _$DueModelFromJson(json);
  Map<String, dynamic> toJson() => _$DueModelToJson(this);

  List<DueModel> parseJsonToList(List<dynamic> json) =>
      (json).map((e) => DueModel.fromJson(e as Map<String, dynamic>)).toList();
}

@JsonSerializable()
class DueDetailModel {
  int? id;
  String? name;
  String? feeStatus;
  int? status;
  int? concessionAmount;
  int? amount;
  int? paid;
  String? dueDate;
  bool? defaulter;

  DueDetailModel({
    this.id,
    this.name,
    this.feeStatus,
    this.status,
    this.concessionAmount,
    this.amount,
    this.paid,
    this.dueDate,
    this.defaulter,
  });

  factory DueDetailModel.fromJson(Map<String, dynamic> json) =>
      _$DueDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$DueDetailModelToJson(this);

  List<DueDetailModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => DueDetailModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

@JsonSerializable(explicitToJson: true)
class InvoiceReceiptModel {
  int? id;
  int? amount;
  String? createdAt;
  String? date;
  String? description;
  String? updatedAt;
  String? uploadToken;
  String? uuid;
  String? status;
  StudentRecordModel? studentRecord;
  String? transaction;

  InvoiceReceiptModel({
    this.id,
    this.amount,
    this.createdAt,
    this.date,
    this.description,
    this.updatedAt,
    this.uploadToken,
    this.uuid,
    this.status,
    this.studentRecord,
    this.transaction,
  });

  factory InvoiceReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceReceiptModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceReceiptModelToJson(this);

  List<InvoiceReceiptModel> parseJsonToList(List<dynamic> json) => (json)
      .map((e) => InvoiceReceiptModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
