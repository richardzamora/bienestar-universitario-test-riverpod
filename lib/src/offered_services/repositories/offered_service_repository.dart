import 'package:app_bienestar_universitario/src/core/services/http/http_service_provider.dart';
import 'package:app_bienestar_universitario/src/offered_services/models/offered_service.dart';
import 'package:app_bienestar_universitario/src/offered_services/repositories/http_offered_service_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final offeredServiceRepository = Provider<OfferedServiceRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return HttpOfferedServiceRepository(httpService);
});

abstract class OfferedServiceRepository {
  String get path;

  Future<List<OfferedService>> getAllOfferedServices();
}
