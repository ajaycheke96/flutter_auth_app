// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dues_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DueModel _$DueModelFromJson(Map<String, dynamic> json) => DueModel(
      dueDetails: json['dueDetails'] == null
          ? null
          : DueDetailModel.fromJson(json['dueDetails'] as Map<String, dynamic>),
      invoiceReceipts: (json['invoiceReceipts'] as List<dynamic>?)
          ?.map((e) => InvoiceReceiptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentRecord: json['studentRecord'] == null
          ? null
          : StudentRecordModel.fromJson(
              json['studentRecord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DueModelToJson(DueModel instance) => <String, dynamic>{
      'dueDetails': instance.dueDetails?.toJson(),
      'invoiceReceipts':
          instance.invoiceReceipts?.map((e) => e.toJson()).toList(),
      'studentRecord': instance.studentRecord?.toJson(),
    };

DueDetailModel _$DueDetailModelFromJson(Map<String, dynamic> json) =>
    DueDetailModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      feeStatus: json['feeStatus'] as String?,
      status: json['status'] as int?,
      concessionAmount: json['concessionAmount'] as int?,
      amount: json['amount'] as int?,
      paid: json['paid'] as int?,
      dueDate: json['dueDate'] as String?,
      defaulter: json['defaulter'] as bool?,
    );

Map<String, dynamic> _$DueDetailModelToJson(DueDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'feeStatus': instance.feeStatus,
      'status': instance.status,
      'concessionAmount': instance.concessionAmount,
      'amount': instance.amount,
      'paid': instance.paid,
      'dueDate': instance.dueDate,
      'defaulter': instance.defaulter,
    };

InvoiceReceiptModel _$InvoiceReceiptModelFromJson(Map<String, dynamic> json) =>
    InvoiceReceiptModel(
      id: json['id'] as int?,
      amount: json['amount'] as int?,
      createdAt: json['createdAt'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      updatedAt: json['updatedAt'] as String?,
      uploadToken: json['uploadToken'] as String?,
      uuid: json['uuid'] as String?,
      status: json['status'] as String?,
      studentRecord: json['studentRecord'] == null
          ? null
          : StudentRecordModel.fromJson(
              json['studentRecord'] as Map<String, dynamic>),
      transaction: json['transaction'] as String?,
    );

Map<String, dynamic> _$InvoiceReceiptModelToJson(
        InvoiceReceiptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'createdAt': instance.createdAt,
      'date': instance.date,
      'description': instance.description,
      'updatedAt': instance.updatedAt,
      'uploadToken': instance.uploadToken,
      'uuid': instance.uuid,
      'status': instance.status,
      'studentRecord': instance.studentRecord?.toJson(),
      'transaction': instance.transaction,
    };
