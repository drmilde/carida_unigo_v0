
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
  });
  
   */

  String getUhrzeitNormalized() {
    List<String> parts = uhrzeit.split(":");
    return "${parts[0]}:${parts[1]}";
  }

}