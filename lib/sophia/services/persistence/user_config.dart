import 'dart:convert';

List<UserConfig> appconfigListFromJson(String str) =>
    List<UserConfig>.from(json.decode(str).map((x) => UserConfig.fromJson(x)));

String appconfigListToJson(List<UserConfig> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

UserConfig appconfigFromJson(String str) => UserConfig.fromJson(json.decode(str));

String appconfigToJson(UserConfig data) => json.encode(data.toJson());

class UserConfig {
  UserConfig({
    required this.id,
    required this.uuid,
    required this.profilname,
    required this.avatarId,
  });

  UserConfig.empty({
    this.id = 0,
    this.uuid = "",
    this.profilname = "",
    this.avatarId = 0,
  });

  int id;
  String uuid;
  String profilname;
  int avatarId;

  factory UserConfig.fromJson(Map<String, dynamic> json) => UserConfig(
        id: json["id"],
        uuid: json["uuid"],
        profilname: json["profilname"],
        avatarId: json["avatarId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "profilname": profilname,
        "avatarId": avatarId,
      };
}
