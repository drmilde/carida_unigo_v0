import 'package:projects/services/backend_service_provider.dart';

import '../unigo_service.dart';

extension ServiceAppLogicExtension on UniGoService {

  Future<bool> registerNewUser() async {
    bool result = await BackendServiceProvider.registerNewUser();
    return result;
  }
}
