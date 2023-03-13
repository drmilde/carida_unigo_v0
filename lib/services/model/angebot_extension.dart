
import 'package:projects/services/model/angebot.dart';

extension AngebotExtension on Angebot {
  /*
   Angebot.empty({
    this.id = 0,
    this.startort = "startort",
    this.zielort = "zielort",
    required this.datum,
    this.uhrzeit = "uhrzeit",
    this.freiplaetze = 0,
    this.hasprofile = const [],
    this.distanz = 0.0,
    this.latitude = 0.0,
    this.longitude = 0.0,
  });
   */

  String getUhrzeitNormalized() {
    List<String> parts = uhrzeit.split(":");
    return "${parts[0]}:${parts[1]}";
  }

}