import 'package:app_bienestar_universitario/src/core/services/http/http_service.dart';
import 'package:app_bienestar_universitario/src/offered_services/models/offered_service.dart';
import 'package:app_bienestar_universitario/src/offered_services/repositories/offered_service_repository.dart';

class HttpOfferedServiceRepository extends OfferedServiceRepository {
  final HttpService httpService;
  HttpOfferedServiceRepository(this.httpService);

  @override
  String get path => "/offeredService";

  @override
  Future<List<OfferedService>> getAllOfferedServices() async {
    try {
      final responseData = await httpService.getAll(
        '$path/getAll',
      );
      return List<OfferedService>.from(
          responseData.map((x) => OfferedService.fromJson(x)));
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }
}
