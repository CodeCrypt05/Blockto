import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingPageController extends GetxController {
  final FirebaseAuth auth = FirebaseService().auth;
  final RxMap userData = {}.obs;

  RxString name = 'JhonWick'.obs;
  RxString email = 'jhonwick@gmail.com'.obs;

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  Future<void> getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();

    if (userSnapshot.exists) {
      userData.value = userSnapshot.data() as Map<String, dynamic>;
      name.value = userData['name'];
      email.value = userData['email'];
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.offAllNamed(AppRoutes.signinScreen);
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
