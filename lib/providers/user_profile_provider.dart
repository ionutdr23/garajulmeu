import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';
import '../repositories/user_profile_repository.dart';

final userProfileRepositoryProvider = Provider((ref) => UserProfileRepository());

final userProfileProvider = StreamProvider.family<UserProfile?, String>((ref, userId) {
  return ref.watch(userProfileRepositoryProvider).watchUserProfile(userId);
});