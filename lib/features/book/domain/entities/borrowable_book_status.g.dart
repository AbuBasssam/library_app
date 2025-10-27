// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowable_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowableBookStatus _$BorrowableBookStatusFromJson(
        Map<String, dynamic> json) =>
    BorrowableBookStatus(
      maxBorrowingDuration: (json['maxBorrowingDuration'] as num).toInt(),
      recommendedBorrowingDuration:
          (json['recommendedBorrowingDuration'] as num).toInt(),
      pickupRequiredHours: (json['pickupRequiredHours'] as num).toInt(),
      finePerDay: (json['finePerDay'] as num).toDouble(),
    );

Map<String, dynamic> _$BorrowableBookStatusToJson(
        BorrowableBookStatus instance) =>
    <String, dynamic>{
      'maxBorrowingDuration': instance.maxBorrowingDuration,
      'recommendedBorrowingDuration': instance.recommendedBorrowingDuration,
      'pickupRequiredHours': instance.pickupRequiredHours,
      'finePerDay': instance.finePerDay,
    };
