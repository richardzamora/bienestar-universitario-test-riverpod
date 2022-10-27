import 'package:app_bienestar_universitario/src/core/services/http/http_service_provider.dart';
import 'package:app_bienestar_universitario/src/login/models/credentials.dart';
import 'package:app_bienestar_universitario/src/login/models/person.dart';
import 'package:app_bienestar_universitario/src/login/repositories/http_login_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return HttpLoginRepository(httpService);
});

abstract class LoginRepository {
  Future<Person> login(Credentials credentials);

  Future<bool> register(Person personRegistered);
}
