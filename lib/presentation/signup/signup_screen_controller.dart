import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreenController extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  static Rx<File?> pickedImageFile = Rx<File?>(null);

  // Initiazlizing Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Uint8List> loadImageData() async {
    final ByteData data =
        await rootBundle.load('assets/images/profile_image.png');
    return data.buffer.asUint8List();
  }

  // Future<void> onCreateAccount() async {
  //   ByteData data = await rootBundle.load(Const().profileImage);
  //   List<int> bytes = data.buffer.asUint8List();

  //   if (registerFormKey.currentState!.validate()) {
  //     try {
  //       final userCredential = await _auth.createUserWithEmailAndPassword(
  //           email: email.text, password: confirmPassword.text);

  //       // Store image
  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('user-images')
  //           .child('${userCredential.user!.uid}.jpg');

  //       if (pickedImageFile.value == null) {
  //         await storageRef.putData(Uint8List.fromList(bytes));
  //       } else {
  //         await storageRef.putFile(pickedImageFile.value!);
  //       }

  //       final imageURL = await storageRef.getDownloadURL();

  //       // Create firestore collection to store data

  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(userCredential.user!.uid)
  //           .set(
  //         {
  //           "unique_id": userCredential.user!.uid.toString(),
  //           "first_name": firstName.text.toString(),
  //           "last_name": lastName.text.toString(),
  //           "email": email.text.toString(),
  //           "password": password.text.toString(),
  //           "confirm_password": confirmPassword.text.toString(),
  //           "image_url": imageURL,
  //         },
  //       );

  //       // Showing Snackbar of Successfully account is created
  //       SnackbarCompnent.showSnackbar(
  //         "Congratulation",
  //         "Account created successfully",
  //         Colors.green,
  //       );

  //       // Get.toNamed(AppRoutes.homeScreen);
  //       Get.offAllNamed(AppRoutes.homeScreen);
  //     } on FirebaseAuthException catch (error) {
  //       print("email is wrong");
  //       Get.back();
  //       if (error.code == 'email-already-in-use') {}
  //       SnackbarCompnent.showSnackbar(
  //           error.message.toString() ?? "Registration failed",
  //           "Please try again",
  //           Colors.red);
  //     }
  //   }
  // }

  // image upload

  void uploadImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    pickedImageFile.value = File(pickedImage.path);
  }

  void uploadImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    pickedImageFile.value = File(pickedImage.path);
  }

  //Bottom Sheet
  static void showOptionsBottomSheet() {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12.h),
            ListTile(
              leading: const Icon(
                Icons.camera,
                color: Colors.amberAccent,
              ),
              title: Text('Camera'),
              onTap: () {
                // RegisterController().uploadImageFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo,
                color: Colors.amberAccent,
              ),
              title: Text('Gallery'),
              onTap: () {
                // RegisterController().uploadImageFromGallery();
                Get.back();
              },
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
