import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(String email, String password) async {
    String res = 'Some errors occurs !!';
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot user = await _firestore
          .collection('liismaiils')
          .doc(userCredential.user?.uid)
          .get();
      print(user);
      return user.toString();
    } catch (e) {
      print(e);
      return (res);
    }
  }

  Future<Object?> loginToken(String token) async {
    try {
      DocumentSnapshot _guest =
          await _firestore.collection('guests').doc(token).get();
      return _guest.data();
    } catch (e) {
      return e.toString();
    }
  }

  pickImageFromFile(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else
      print('No image selected or  or !!');
  }
}
