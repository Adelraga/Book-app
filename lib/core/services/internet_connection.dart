// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fruit_market_app/core/widgets/Custom_SnakBar.dart';
// import 'package:get/get.dart';

// class EnternetConnectivity extends GetxController {
//   final Connectivity _connection = Connectivity();

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     _connection.onConnectivityChanged.listen(checkConnectivity);
//   }

//   void checkConnectivity(ConnectivityResult connectivityResult) async {
//     if (connectivityResult == ConnectivityResult.none) {
//       Showsnackbar(" No Enternet Connectivity");
//     } else {
//       if (Get.isSnackbarOpen) {
//         Get.closeCurrentSnackbar();
//       }
//     }
//   }
// }connectivity_plus]
