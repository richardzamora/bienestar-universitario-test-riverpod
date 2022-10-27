import 'package:app_bienestar_universitario/src/core/services/http/dio_http_service.dart';
import 'package:app_bienestar_universitario/src/core/services/http/http_service.dart';
import 'package:app_bienestar_universitario/src/core/services/storage/storage_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final httpServiceProvider = Provider<HttpService>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  return DioHttpService(storageService);
});
