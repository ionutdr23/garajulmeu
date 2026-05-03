import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/family.dart';

class FamilyRepository {
  final FirebaseFirestore _firestore;

  FamilyRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _familiesRef =>
      _firestore.collection('families');

  Future<Family?> getFamily(String familyId) async {
    final doc = await _familiesRef.doc(familyId).get();
    if (!doc.exists) return null;
    return Family.fromJson({'id': doc.id, ...doc.data()!});
  }

  Stream<Family?> watchFamily(String familyId) {
    return _familiesRef.doc(familyId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return Family.fromJson({'id': doc.id, ...doc.data()!});
    });
  }

  Future<void> createFamily(Family family) =>
      _familiesRef.doc(family.id).set(_toFirestore(family));

  Future<void> updateFamily(Family family) =>
      _familiesRef.doc(family.id).update(_toFirestore(family));

  Future<void> deleteFamily(String familyId) =>
      _familiesRef.doc(familyId).delete();

  Future<Family?> getFamilyByInviteCode(String inviteCode) async {
    final snapshot = await _familiesRef
        .where('inviteCode', isEqualTo: inviteCode)
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    return Family.fromJson({'id': doc.id, ...doc.data()});
  }

  Future<void> joinFamily(String familyId, String userId) =>
      _familiesRef.doc(familyId).update({
        'memberIds': FieldValue.arrayUnion([userId]),
      });

  Future<void> leaveFamily(String familyId, String userId) =>
      _familiesRef.doc(familyId).update({
        'memberIds': FieldValue.arrayRemove([userId]),
      });

  static String generateInviteCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return List.generate(6, (_) => chars[random.nextInt(chars.length)]).join();
  }

  Map<String, dynamic> _toFirestore(Family family) => {
    'name': family.name,
    'ownerId': family.ownerId,
    'memberIds': family.memberIds,
    'inviteCode': family.inviteCode,
  };
}
