import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_station/model/sellerModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellerController extends GetxController {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('sellers');

  RxBool isLoading = false.obs;

  void sellerSingUp(SellerModel seller) async {
    isLoading.value = true;
    try {
      await _usersCollection.add(seller.toMap());
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      isLoading.value = false;
    }
  }
}
