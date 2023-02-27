// To parse this JSON data, do
//
//     final userConfig = userConfigFromJson(jsonString);

import 'dart:convert';

List<UserConfig> userConfigListFromJson(String str) =>
    List<UserConfig>.from(json.decode(str).map((x) => UserConfig.fromJson(x)));

String userConfigListToJson(List<UserConfig> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

UserConfig userConfigFromJson(String str) =>
    UserConfig.fromJson(json.decode(str));

String userConfigToJson(UserConfig data) => json.encode(data.toJson());

class UserConfig {
  UserConfig({
    required this.version,
    required this.user,
    required this.profile,
  });

  String version;
  User user;
  Profile profile;

  UserConfig.empty({
    this.version = "",
    this.user = const User.empty(),
    this.profile = const Profile.empty(),
  });

  factory UserConfig.fromJson(Map<String, dynamic> json) => UserConfig(
        version: json["version"],
        user: User.fromJson(json["user"]),
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "user": user.toJson(),
        "profile": profile.toJson(),
      };
}

class Profile {
  Profile({
    required this.profilId,
    required this.uuid,
    required this.displayName,
    required this.tier,
    required this.rauchen,
    required this.bewertung,
    required this.fahrzeug,
    required this.kmgefahren,
    required this.punktegesammelt,
  });

  final int profilId;
  final String uuid;
  final String displayName;
  final bool tier;
  final bool rauchen;
  final double bewertung;
  final List<String> fahrzeug;
  final double kmgefahren;
  final int punktegesammelt;

  const Profile.empty({
    this.profilId = 0,
    this.uuid = "",
    this.displayName = "",
    this.tier = false,
    this.rauchen = false,
    this.bewertung = 0.0,
    this.fahrzeug = const [],
    this.kmgefahren = 0.0,
    this.punktegesammelt = 0,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        profilId: json["profilId"],
        uuid: json["uuid"],
        displayName: json["displayName"],
        tier: json["tier"],
        rauchen: json["rauchen"],
        bewertung: json["bewertung"]?.toDouble(),
        fahrzeug: List<String>.from(json["fahrzeug"].map((x) => x)),
        kmgefahren: json["kmgefahren"]?.toDouble(),
        punktegesammelt: json["punktegesammelt"],
      );

  Map<String, dynamic> toJson() => {
        "profilId": profilId,
        "uuid": uuid,
        "displayName": displayName,
        "tier": tier,
        "rauchen": rauchen,
        "bewertung": bewertung,
        "fahrzeug": List<dynamic>.from(fahrzeug.map((x) => x)),
        "kmgefahren": kmgefahren,
        "punktegesammelt": punktegesammelt,
      };
}

class User {
  User({
    required this.fdnummer,
    required this.vorname,
    required this.nachname,
    required this.passwort,
    required this.email,
    required this.geburtsdatum,
    required this.uuid,
    required this.profilId,
  });

  final String fdnummer;
  final String vorname;
  final String nachname;
  final String passwort;
  final String email;
  final String geburtsdatum;
  final String uuid;
  final int profilId;

  const User.empty({
    this.fdnummer = "",
    this.vorname = "",
    this.nachname = "",
    this.passwort = "",
    this.email = "",
    this.geburtsdatum = "",
    this.uuid = "",
    this.profilId = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fdnummer: json["fdnummer"],
        vorname: json["vorname"],
        nachname: json["nachname"],
        passwort: json["passwort"],
        email: json["email"],
        geburtsdatum: json["geburtsdatum"],
        uuid: json["uuid"],
        profilId: json["profilId"],
      );

  Map<String, dynamic> toJson() => {
        "fdnummer": fdnummer,
        "vorname": vorname,
        "nachname": nachname,
        "passwort": passwort,
        "email": email,
        "geburtsdatum": geburtsdatum,
        "uuid": uuid,
        "profilId": profilId,
      };
}
