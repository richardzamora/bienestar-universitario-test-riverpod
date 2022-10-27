import 'package:app_bienestar_universitario/src/core/services/http/http_service.dart';
import 'package:app_bienestar_universitario/src/home/models/campus.dart';
import 'package:app_bienestar_universitario/src/home/repositories/home_repository.dart';

class HttpHomeRepository extends HomeRepository {
  final HttpService httpService;
  HttpHomeRepository(this.httpService);

  @override
  String get path => "/campus";

  @override
  Future<List<Campus>> getAllCampus() async {
    try {
      final responseData = await httpService.getAll(
        '$path/getAll',
      );
      return List<Campus>.from(responseData.map((x) => Campus.fromJson(x)));
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }
}
