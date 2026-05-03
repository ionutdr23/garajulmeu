import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/family.dart';
import '../models/user_profile.dart';
import '../repositories/family_repository.dart';
import 'user_profile_provider.dart';

final familyRepositoryProvider = Provider((ref) => FamilyRepository());

final familyProvider = StreamProvider.family<Family?, String>((ref, familyId) {
  return ref.watch(familyRepositoryProvider).watchFamily(familyId);
});

final familyService = Provider((ref) => FamilyService(ref));

class FamilyService {
  final Ref _ref;
  FamilyService(this._ref);

  Future<void> createFamily(String userId, String familyName) async {
    final familyRepo = _ref.read(familyRepositoryProvider);
    final userRepo = _ref.read(userProfileRepositoryProvider);

    final familyId = DateTime.now().millisecondsSinceEpoch.toString();
    String inviteCode;
    do {
      inviteCode = FamilyRepository.generateInviteCode();
    } while (await familyRepo.getFamilyByInviteCode(inviteCode) != null);

    final family = Family(
      id: familyId,
      name: familyName,
      ownerId: userId,
      memberIds: [userId],
      inviteCode: inviteCode,
    );

    await familyRepo.createFamily(family);
    await userRepo.createUserProfile(
      UserProfile(id: userId, familyId: familyId),
    );
  }

  Future<void> joinFamily(String userId, String inviteCode) async {
    final familyRepo = _ref.read(familyRepositoryProvider);
    final userRepo = _ref.read(userProfileRepositoryProvider);

    final family = await familyRepo.getFamilyByInviteCode(inviteCode);
    if (family == null) {
      throw Exception('Codul de invitație nu există.');
    }

    await familyRepo.joinFamily(family.id, userId);
    await userRepo.createUserProfile(
      UserProfile(id: userId, familyId: family.id),
    );
  }
}
