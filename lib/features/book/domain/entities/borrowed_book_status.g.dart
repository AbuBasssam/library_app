// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowed_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowedBookStatus _$BorrowedBookStatusFromJson(Map<String, dynamic> json) =>
    BorrowedBookStatus(
      borrowId: (json['borrowId'] as num).toInt(),
      borrowDate: DateTime.parse(json['borrowDate'] as String),
      dueDate: DateTime.parse(json['dueDate'] as String),
      maxExtensionCount: (json['maxExtensionCount'] as num).toInt(),
      maxExtensionDays: (json['maxExtensionDays'] as num).toInt(),
      maxBorrowingDays: (json['maxBorrowingDays'] as num).toInt(),
      canExtend: json['canExtend'] as bool,
      disableReason: json['disableReason'] as String?,
    );

Map<String, dynamic> _$BorrowedBookStatusToJson(BorrowedBookStatus instance) =>
    <String, dynamic>{
      'borrowId': instance.borrowId,
      'borrowDate': instance.borrowDate.toIso8601String(),
      'dueDate': instance.dueDate.toIso8601String(),
      'maxExtensionCount': instance.maxExtensionCount,
      'maxExtensionDays': instance.maxExtensionDays,
      'maxBorrowingDays': instance.maxBorrowingDays,
      'canExtend': instance.canExtend,
      'disableReason': instance.disableReason,
    };
