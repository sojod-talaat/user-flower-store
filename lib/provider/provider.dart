import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userflowerstore/app_router.dart';
import 'package:userflowerstore/firebase/auth.dart';
import 'package:userflowerstore/firebase/firestore.dart';
import 'package:userflowerstore/firebase/storage.dart';
import 'package:userflowerstore/views/user.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../models/siLder.dart';

class FireStoreProvider extends ChangeNotifier {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescprition = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController silderName = TextEditingController();
  File? selectedImage;
  List<Category> categories = [];
  List<Product> products = [];
  List<Silderitem> imagesliderslist = [];
  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  FireStoreProvider() {
    getAllCategory();
    getAllsliders();
  }


  getAllCategory() async {
    categories =
        await FireStoreHelper.fireStoreHelper.getCategoryFromFireStore();
    notifyListeners();
  }


  getAllProduct(String ctid) async {
    products = await FireStoreHelper.fireStoreHelper.getAlProduct(ctid);
    notifyListeners();
  }
  changebottomnav(){

  }

/////////////////////////////////////////////////////////////////////////////////

  getAllsliders() async {
    imagesliderslist = await FireStoreHelper.fireStoreHelper.getAllSliders();
    notifyListeners();
  }

  addNewSlider() async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Silderitem imageSliders =
          Silderitem(imagesliderUrl: imageUrl, title: silderName.text);
      FireStoreHelper.fireStoreHelper..addNweSlider(imageSliders);
      imagesliderslist.add(imageSliders);
      selectedImage = null;
      silderName.clear();
      notifyListeners();

      getAllsliders();
    }
  }


}

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  NullValidate(String? v) {
    if (v == null || v.isEmpty) {
      return "this felied required";
    }
  }

  passworadVailidation(String V) {
    if (V.length < 6) {
      return "password weak,must be contanin 6 digat at least";
    }
  }

  emailValidation(String value) {

  }

  Signin() async {
    UserCredential? credential = await AuthHelper.auth
        .Signin(loginemailcontroller.text, loginpasswordcontroller.text);

    AppRouter.NavigateToWidget( UserPage());


  }

  sigUp() async {
    if (signUpKey.currentState!.validate()) {
      UserCredential? userq = await AuthHelper.auth
          .userSignUP(emailcontroller.text, passwordcontroller.text);
      if (userq != null) {
        AppRouter.NavigateWithReplacemtnToWidget(UserPage());
      }

    }
  }

  checUser() {
    AuthHelper.auth.checkUser();
  }

  signout() {
    AuthHelper.auth.Singout();
  }
}
