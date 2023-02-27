
import 'model/object_not_found_exception.dart';
import 'backend_service_provider.dart';

class UniGoService {
  final String methodGetList = "getList";
  final String methodGetObjectById = "getObjectById";
  final String methodUpdateObjectById = "updateObjectById";
  final String methodCreateObjectById = "createObjectById";
  final String methodDeleteObjectById = "deleteObjectById";

  // Hier alle CRUD Operationen

  Future<RT> wrapper<RT, T>({
    required String method,
    required int id,
    required T data,
    required RT initRTVal,
    required String resourcePath,
    Map<String, String> searchParams = const {},
    required Function(String) listFromJson,
    required Function(String) objectFromJson,
    required Function(T) objectToJson,
  }) async {
    RT result = initRTVal;

    switch (method) {
      case "getList":
        {
          RT result = await BackendServiceProvider.getObjectList<RT, T>(
            resourcePath: resourcePath,
            listFromJson: listFromJson,
            searchParams: searchParams,
          );

          return result as RT;
        }
      case "getObjectById":
        {
          List<T> result =
              await BackendServiceProvider.getObjectById<List<T>, T>(
            id: id,
            resourcePath: resourcePath,
            objectFromJson: objectFromJson,
          );

          if (result!.isEmpty) {
            throw ObjectNotFoundException();
          }

          return result[0] as RT;
        }
      case "createObjectById":
        {
          RT result = await BackendServiceProvider.createObject<RT, T>(
            data: data,
            objectToJson: objectToJson,
            objectFromJson: objectFromJson,
            resourcePath: resourcePath,
          );
          return result;
        }
      case "updateObjectById":
        {
          RT result = await BackendServiceProvider.updateObjectById<RT, T>(
            id: id,
            data: data,
            resourcePath: resourcePath,
            objectToJson: objectToJson,
          );
          return result;
        }
      case "deleteObjectById":
        {
          RT result = await BackendServiceProvider.deleteObjectById<RT>(
            id: id,
            resourcePath: resourcePath,
          );
          return result;
        }
    }

    return result;
  }
}
