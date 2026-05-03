import 'package:freezed_annotation/freezed_annotation.dart';

part 'family.freezed.dart';
part 'family.g.dart';

@freezed
abstract class Family with _$Family {
  const factory Family({
    required String id,
    required String name,
    required String ownerId,
    required List<String> memberIds,
    required String inviteCode,
  }) = _Family;

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
}
