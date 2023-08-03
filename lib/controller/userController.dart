import 'package:coffee_station/model/userModel.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  RxBool isLoading = false.obs;

  void signUp(UserModel user) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (userCredential.user != null) {
        await _usersCollection.doc(userCredential.user!.uid).set(user.toMap());
        Get.snackbar('Success', 'Signup successful');
        isLoading.value = false;
        // Here you can navigate to the next screen or do any other operation.
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }

// signup_controller.dart

  // Rest of your code

  Future<bool> signIn(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        Get.snackbar('Success', 'Signin successful');
        isLoading.value = false;
        return true; // Return true if signin is successful
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
    return false; // Return false if signin is unsuccessful
  }
}
