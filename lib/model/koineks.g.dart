// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'koineks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Koineks _$KoineksFromJson(Map<String, dynamic> json) {
  return Koineks(json['short_code'] as String, json['name'] as String,
      json['current'] as String);
}

Map<String, dynamic> _$KoineksToJson(Koineks instance) => <String, dynamic>{
      'short_code': instance.shortCode,
      'name': instance.name,
      'current': instance.current
    };
