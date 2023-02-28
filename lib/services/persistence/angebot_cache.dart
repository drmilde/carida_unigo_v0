import 'package:projects/services/extensions/unigo_service_angebot_extension.dart';
import 'package:projects/services/unigo_service.dart';

import '../model/angebot.dart';

class AngebotCache {
  UniGoService service = UniGoService();
  List<Angebot> cache = [];

  Future<int> loadAngebotCache() async {
    cache = await service.getAngebotList();
    return cache.length;
  }
}