import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(String email, String password) async {
    String res = 'Some errors occurs !!';
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (kDebugMode) {
        print(userCredential);
      }
      DocumentSnapshot user = await _firestore
          .collection('liismaiils')
          .doc(userCredential?.user?.uid)
          .get();
      if (kDebugMode) {
        print(userCredential?.user?.uid);
      }
      if (userCredential.user?.uid != null) {
        return user.toString();
      } else {
        return 'user do not exist any more in db';
      }
    } catch (e) {
      debugPrint(e as String?);
      return (res);
    }
  }

  Future<String> loginToken(String token) async {
    try {
      DocumentSnapshot guest =
          await _firestore.collection('guests').doc(token).get();
      debugPrint(token);
      debugPrint(guest.data().toString());

      if (guest.data() != null) {
        debugPrint(guest.data().toString());
        return guest.data().toString();
      } else {
        await _firestore
            .collection('guests')
            .doc(token)
            .set({'created': DateTime});
        return 'user created';
      }
    } catch (e) {
      return e.toString();
    }
  }

  pickImageFromFile(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      print('No image selected or  or !!');
    }
  }
}
