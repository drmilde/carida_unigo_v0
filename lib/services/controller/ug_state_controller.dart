import 'dart:ui';

import 'package:get/get.dart';
import 'package:projects/config/app_constants.dart';

import '../persistence/user_config.dart';
import '../persistence/persistence_manager.dart';

class UGStateController extends GetxController {
  // einfacher Ansatz, um auf (beliebige) Veränderungen zu reagieren
  var somethingChanged = 0.obs;
  var selectedPage = 0.obs; // selected Pag in BottomNavigationBar

  late UserConfig userConfig;
  bool userConfigLoaded = false; // wenn geladen/wenn gespeichert

  AppConstants appConstants = AppConstants();

  int AvatarCount = 404;
  var myAvatar = 1.obs;
  var editAvatar = false.obs;

  List<VoidCallback> callbacks = [
    () {
      print("Hallo 0");
    },
    () {
      print("Hallo 1");
    },
    () {
      print("Hallo 2");
    },
    () {
      print("Hallo 3");
    },
    () {
      print("Hallo 4");
    },
  ];

  void toggleEditAvatar() {
    editAvatar.value = !editAvatar.value;
  }

  PersitenceManager persistenceManager = PersitenceManager();

  @override
  void onInit() {
    super.onInit();
    userConfig = UserConfig.empty();
    //loadStore();
  }

  /* global change */

  void change() {
    somethingChanged++;
  }

  /* persistence */

  void loadStore() {
    userConfigLoaded = false;
    persistenceManager.loadStore().then((value) {
      userConfig = value;
      userConfigLoaded = true;
    });
  }

  void saveStore() {
    persistenceManager
        .saveStore(userConfig)
        .then((value) => userConfigLoaded = value);
  }
}
