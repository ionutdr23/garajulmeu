import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile.dart';

class UserProfileRepository {
  final FirebaseFirestore _firestore;

  UserProfileRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _userProfilesRef =>
      _firestore.collection('users');

  Future<UserProfile?> getUserProfile(String userId) async {
    final doc = await _userProfilesRef.doc(userId).get();
    if (!doc.exists) return null;
    return UserProfile.fromJson({'id': doc.id, ...doc.data()!});
  }

  Stream<UserProfile?> watchUserProfile(String userId) {
    return _userProfilesRef.doc(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return UserProfile.fromJson({'id': doc.id, ...doc.data()!});
    });
  }

  Future<void> createUserProfile(UserProfile userProfile) =>
      _userProfilesRef.doc(userProfile.id).set(_toFirestore(userProfile));

  Map<String, dynamic> _toFirestore(UserProfile userProfile) => {
    'id': userProfile.id,
    'familyId': userProfile.familyId,
  };
}
