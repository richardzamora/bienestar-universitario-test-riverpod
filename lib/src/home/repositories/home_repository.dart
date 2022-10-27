import 'package:app_bienestar_universitario/src/core/services/http/http_service_provider.dart';
import 'package:app_bienestar_universitario/src/home/models/campus.dart';
import 'package:app_bienestar_universitario/src/home/repositories/http_home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return HttpHomeRepository(httpService);
});

abstract class HomeRepository {
  String get path;

  Future<List<Campus>> getAllCampus();
}
