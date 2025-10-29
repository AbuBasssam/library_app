// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserved_book_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservedBookStatus _$ReservedBookStatusFromJson(Map<String, dynamic> json) =>
    ReservedBookStatus(
      json['estimatedAvailableDate'] == null
          ? null
          : DateTime.parse(json['estimatedAvailableDate'] as String),
      ReservedBookStatus._parseDuration(json['pickupTimeRemainder'] as String?),
      reservationId: (json['reservationId'] as num).toInt(),
      isReady: json['isReady'] as bool,
      waitingListCount: (json['peopleAhead'] as num).toInt(),
    );

Map<String, dynamic> _$ReservedBookStatusToJson(ReservedBookStatus instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'isReady': instance.isReady,
      'estimatedAvailableDate':
          instance.estimatedAvailableDate?.toIso8601String(),
      'pickupTimeRemainder': instance.remainingTime?.inMicroseconds,
      'peopleAhead': instance.waitingListCount,
    };
