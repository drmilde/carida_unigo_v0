import 'dart:convert' show utf8;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model/object_not_found_exception.dart';

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
}
