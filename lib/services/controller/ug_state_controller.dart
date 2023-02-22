import 'package:get/get.dart';
import 'package:projects/config/app_constants.dart';

import '../persistence/user_config.dart';
import '../persistence/persistence_manager.dart';

class UGStateController extends GetxController {
  // einfacher Ansatz, um auf (beliebige) Veränderungen zu reagieren
  var somethingChanged = 0.obs;
  var selectedPage = 0.obs; // selected Pag in BottomNavigationBar

  late UserConfig userConfig;
  bool appConfigLoaded = false; // wenn geladen/wenn gespeichert

  AppConstants appConstants = AppConstants();

  int AvatarCount = 404;
  var myAvatar = 1.obs;
  var editAvatar = false.obs;

  void toggleEditAvatar() {
    editAvatar.value = !editAvatar.value;
  }

  PersitenceManager persistenceManager = PersitenceManager();

  @override
  void onInit() {
    super.onInit();
    //loadStore();
  }

  /* global change */

  void change() {
    somethingChanged++;
  }

  /* persistence */

  void loadStore() {
    appConfigLoaded = false;
    persistenceManager.loadStore().then((value) {
      userConfig = value;
      appConfigLoaded = true;
    });
  }

  void saveStore() {
    persistenceManager
        .saveStore(userConfig)
        .then((value) => appConfigLoaded = value);
  }
}
