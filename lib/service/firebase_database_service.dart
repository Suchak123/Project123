
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project123/model/userModel.dart';

class FirebaseDatabaseService {

  final _firestoreDb = FirebaseFirestore.instance;

  void createUserInCloudFirebase({required UserModel userModel}) async {
    try{
      final CollectionReference _usersCollectionReference = await _firestoreDb.collection('users');
      await _usersCollectionReference.add(userModel.toJson()).whenComplete(() {
        print('User Creation Success');
      });
    } catch (e) {
      print('Something went wrong $e');
    }
  }
}