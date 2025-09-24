// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBook _$HomeBookFromJson(Map<String, dynamic> json) => HomeBook(
      baseData: BaseBookData.fromJson(json['baseData'] as Map<String, dynamic>),
      isFirstCategory: json['isFirstCategory'] as bool,
      isMostPopular: json['isMostPopular'] as bool,
    );

Map<String, dynamic> _$HomeBookToJson(HomeBook instance) => <String, dynamic>{
      'baseData': instance.baseData,
      'isFirstCategory': instance.isFirstCategory,
      'isMostPopular': instance.isMostPopular,
    };
