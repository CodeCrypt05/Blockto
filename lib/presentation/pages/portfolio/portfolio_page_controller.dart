import 'package:blockto_app/data/firebase_services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PortfolioPageController extends GetxController {
  final FirebaseAuth auth = FirebaseService().auth;
  final RxMap coinList = {}.obs;
  // Query<Map<String, dynamic>> querySnapshot = {} as Query<Map<String, dynamic>>;

  GetBuyedCoinList() {}
}
