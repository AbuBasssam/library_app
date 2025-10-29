// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservable_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservableBookStatus _$ReservableBookStatusFromJson(
        Map<String, dynamic> json) =>
    ReservableBookStatus(
      pickupWindowHours: (json['pickupExpiryHours'] as num).toInt(),
      maxActiveReservations: (json['maxActiveReservations'] as num).toInt(),
      waitingListCount: (json['peopleAhead'] as num).toInt(),
      estimatedAvailableDate:
          DateTime.parse(json['estimatedAvailableDate'] as String),
    );

Map<String, dynamic> _$ReservableBookStatusToJson(
        ReservableBookStatus instance) =>
    <String, dynamic>{
      'estimatedAvailableDate':
          instance.estimatedAvailableDate.toIso8601String(),
      'maxActiveReservations': instance.maxActiveReservations,
      'pickupExpiryHours': instance.pickupWindowHours,
      'peopleAhead': instance.waitingListCount,
    };
