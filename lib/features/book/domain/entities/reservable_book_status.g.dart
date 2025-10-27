// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservable_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservableBookStatus _$ReservableBookStatusFromJson(
        Map<String, dynamic> json) =>
    ReservableBookStatus(
      waitingListCount: (json['waitingListCount'] as num).toInt(),
      estimatedDays: (json['estimatedDays'] as num).toInt(),
    );

Map<String, dynamic> _$ReservableBookStatusToJson(
        ReservableBookStatus instance) =>
    <String, dynamic>{
      'waitingListCount': instance.waitingListCount,
      'estimatedDays': instance.estimatedDays,
    };
