// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Family _$FamilyFromJson(Map<String, dynamic> json) => _Family(
  id: json['id'] as String,
  name: json['name'] as String,
  ownerId: json['ownerId'] as String,
  memberIds: (json['memberIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  inviteCode: json['inviteCode'] as String,
);

Map<String, dynamic> _$FamilyToJson(_Family instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'ownerId': instance.ownerId,
  'memberIds': instance.memberIds,
  'inviteCode': instance.inviteCode,
};
