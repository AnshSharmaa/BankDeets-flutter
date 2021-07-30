import 'package:cloud_firestore/cloud_firestore.dart';

class DatabseService {
  CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('data');

  Future addData(String fullName, String email, String phoneNumber,
      String accountNumber, String ifscCode) async {
    // Call the user's CollectionReference to add a new user
    return await dataCollection
        .add({
          'full_name': fullName,
          'email': email,
          'phoneNumber': phoneNumber,
          'accountNumber': accountNumber,
          'ifscCode': ifscCode,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
