// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserved_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservedBookStatus _$ReservedBookStatusFromJson(Map<String, dynamic> json) =>
    ReservedBookStatus(
      remainingTime:
          Duration(microseconds: (json['remainingTime'] as num).toInt()),
    );

Map<String, dynamic> _$ReservedBookStatusToJson(ReservedBookStatus instance) =>
    <String, dynamic>{
      'remainingTime': instance.remainingTime.inMicroseconds,
    };
