// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservable_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservableBookStatus _$ReservableBookStatusFromJson(
        Map<String, dynamic> json) =>
    ReservableBookStatus(
      waitingListCount: (json['peopleAhead'] as num).toInt(),
      estimatedAvailableDate:
          DateTime.parse(json['estimatedAvailableDate'] as String),
    );

Map<String, dynamic> _$ReservableBookStatusToJson(
        ReservableBookStatus instance) =>
    <String, dynamic>{
      'peopleAhead': instance.waitingListCount,
      'estimatedAvailableDate':
          instance.estimatedAvailableDate.toIso8601String(),
    };
