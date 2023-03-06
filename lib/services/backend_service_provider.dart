import 'dart:convert' show utf8;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/extensions/unigo_service_nutzer_extension.dart';
import 'package:projects/services/extensions/unigo_service_profil_extension.dart';
import 'package:projects/services/unigo_service.dart';

import 'model/nutzer.dart';
import 'model/object_not_found_exception.dart';
import 'model/profil.dart';
import 'persistence/user_config.dart';

class BackendServiceProvider {
  //static String host = "localhost:8000";
  //static String host = "10.0.2.2:8000";
  //static String host = "193.174.29.13";
  static String host = "unigo.informatik.hs-fulda.de";
  static String apiPath = "/ugbackend/api/v1";
  static String token = "d4b07361a2605d8255c3bf3d706615a911c843bb";
  static var headers = {
    'Authorization': 'Token d4b07361a2605d8255c3bf3d706615a911c843bb'
  };

  static UGStateController _controller = Get.find();
  static UniGoService service = UniGoService();

  /* HELPER */

  static Future<RT> getObjectList<RT, T>({
    required String resourcePath,
    required Function(String) listFromJson,
    Map<String, String> searchParams = const {},
  }) async {
    var url = Uri.https(
      host,
      '${apiPath}/${resourcePath}.json',
      searchParams,
    );
    //print (url);
    var response = await http.get(
      url,
      headers: headers,
    );
    String resUTF8 = utf8.decode(response.bodyBytes);
    //print(response.statusCode);

    if (response.statusCode == 200) {
      RT data = listFromJson(resUTF8);
      return (data as RT);
    } else {
      return [] as RT;
    }
  }

  static Future<RT> getObjectById<RT, T>({
    required int id,
    required String resourcePath,
    required Function(String) objectFromJson,
  }) async {
    var url = Uri.https(host, '${apiPath}/${resourcePath}/${id}.json');
    var response = await http.get(
      url,
      headers: headers,
    );

    //print(response.headers);
    //print(response.statusCode);

    String resUTF8 = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {
      T object = objectFromJson(resUTF8);
      return ([object as T] as RT);
    } else {
      throw ObjectNotFoundException();
    }
  }

  static Future<RT> createObject<RT, T>({
    required T data,
    required Function(T) objectToJson,
    required Function(String) objectFromJson,
    required String resourcePath,
  }) async {
    var url = Uri.https(host, '${apiPath}/${resourcePath}.json');

    String json = objectToJson(data);

    http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: json,
    );
    String answer = utf8.decode(response.bodyBytes);
    if (response.statusCode == 201) {
      return objectFromJson(answer) as RT;
    }

    if (response.statusCode == 400) {
      return data as RT;
    }
    return data as RT;
  }

  static Future<RT> updateObjectById<RT, T>({
    required int id,
    required T data,
    required Function(T) objectToJson,
    required String resourcePath,
  }) async {
    var url = Uri.https(host, '${apiPath}/${resourcePath}/${id}.json');
    String json = objectToJson(data);

    http.Response resonse = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: json,
    );
    if (resonse.statusCode == 200) {
      return true as RT;
    }
    return false as RT;
  }

  static Future<RT> deleteObjectById<RT>({
    required int id,
    required String resourcePath,
  }) async {
    var url = Uri.https(host, '${apiPath}/${resourcePath}/${id}.json');

    http.Response resonse = await http.delete(
      url,
      headers: headers,
    );
    if (resonse.statusCode == 204) {
      return true as RT;
    }
    return false as RT;
  }

  /* komplexere Aktionen */

  static Future<bool> registerNewUser() async {
    // TODO load relevant data
    // TODO create User and store id, profilID und UUID

    bool result = true;

    // Anlegen des Profils und speichern der profil_id
    Profil profil = Profil.empty(
      id: 0,
      vorname: "vorname",
      beschreibung: "beschreibung",
      bewertung: "bewertung",
      fahrzeug: "fahrzeug",
      kmgefahren: 0,
      raucher: "nein",
      tier: "nein",
    );

    Profil profil_answer = await service.createProfilById(
      id: 0,
      data: profil,
    );

    // Falls Profil erfolgreich angelegt wurde, dann Nutzer anlegen
    if (profil_answer.id != 0) {
      Nutzer nutzer = Nutzer(
        id: 0,
        vorname: "anonym",
        nachname: "anonym",
        email: "mail@anonymus.de",
        geburtsdatum: "01-01-1970",
        passwort: "unbekannt",
        uuid: "",
        hasprofile: [profil_answer.id],
      );

      Nutzer nutzer_answer =
          await service.createNutzerById(id: 0, data: nutzer);

      /* Falls Nutzer erfolgreich angelegt wurde, Übertragung in das lokale Profil */
      if (nutzer_answer.id != 0) {
        print("Profil ID: ${profil_answer.id}");
        print("Nutzer ID: ${nutzer_answer.id}");
        print("Nutzer UUID: ${nutzer_answer.uuid}");

        User user = User(
          vorname: "",
          nachname: "",
          email: "",
          fdnummer: "",
          geburtsdatum: "",
          passwort: "",
          profilId: profil_answer.id,
          id: nutzer_answer.id,
          uuid: nutzer_answer.uuid,
        );

        Profile profile = Profile(
          profilId: profil_answer.id,
          uuid: nutzer_answer.uuid,
          displayName: "",
          tier: false,
          rauchen: false,
          bewertung: 0.0,
          fahrzeug: ["fahrzeug"],
          kmgefahren: 0,
          punktegesammelt: 0,
        );

        UserConfig config = UserConfig(
          version: "v1",
          user: user,
          profile: profile,
        );

        _controller.userConfig = config;
        result = await _controller.persistenceManager
            .saveStore(_controller.userConfig);

        print("UserConfig created and persisted: ${result}");
      }
    }
    return result;
  }
}
