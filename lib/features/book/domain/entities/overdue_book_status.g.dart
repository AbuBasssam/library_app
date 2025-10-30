// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overdue_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverdueBookStatus _$OverdueBookStatusFromJson(Map<String, dynamic> json) =>
    OverdueBookStatus(
      dueDate: DateTime.parse(json['dueDate'] as String),
      lateFee: (json['estimatedFine'] as num).toDouble(),
    );

Map<String, dynamic> _$OverdueBookStatusToJson(OverdueBookStatus instance) =>
    <String, dynamic>{
      'dueDate': instance.dueDate.toIso8601String(),
      'estimatedFine': instance.lateFee,
    };
