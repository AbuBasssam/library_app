// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMeta _$BookMetaFromJson(Map<String, dynamic> json) => BookMeta(
      maxBorrowingDuration: (json['maxBorrowingDuration'] as num?)?.toInt(),
      recommededBorrowingDuration:
          (json['recommededBorrowingDuration'] as num?)?.toInt(),
      pickupRequiredHours: (json['pickupRequiredHours'] as num?)?.toInt(),
      finePerDay: (json['finePerDay'] as num?)?.toDouble(),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      estimatedFine: (json['estimatedFine'] as num?)?.toDouble(),
      estimatedAvailableDate: json['estimatedAvailableDate'] == null
          ? null
          : DateTime.parse(json['estimatedAvailableDate'] as String),
      peopleAhead: (json['peopleAhead'] as num?)?.toInt(),
      pickupTimeRemainder: json['pickupTimeRemainder'] as String?,
    );

Map<String, dynamic> _$BookMetaToJson(BookMeta instance) => <String, dynamic>{
      'maxBorrowingDuration': instance.maxBorrowingDuration,
      'recommededBorrowingDuration': instance.recommededBorrowingDuration,
      'pickupRequiredHours': instance.pickupRequiredHours,
      'finePerDay': instance.finePerDay,
      'dueDate': instance.dueDate?.toIso8601String(),
      'estimatedFine': instance.estimatedFine,
      'estimatedAvailableDate':
          instance.estimatedAvailableDate?.toIso8601String(),
      'peopleAhead': instance.peopleAhead,
      'pickupTimeRemainder': instance.pickupTimeRemainder,
    };
