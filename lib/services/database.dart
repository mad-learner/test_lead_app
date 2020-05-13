import 'package:cloud_firestore/cloud_firestore.dart';

mixin DatabaseService {

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  // Future updateUserData()

}