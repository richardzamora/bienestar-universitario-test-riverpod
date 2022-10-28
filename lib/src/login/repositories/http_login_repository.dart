import 'package:app_bienestar_universitario/src/core/services/http/http_service.dart';
import 'package:app_bienestar_universitario/src/login/models/credentials.dart';
import 'package:app_bienestar_universitario/src/login/models/person.dart';
import 'package:app_bienestar_universitario/src/login/repositories/login_repository.dart';

class HttpLoginRepository extends LoginRepository {
  final HttpService httpService;
  HttpLoginRepository(this.httpService);

  String get path => "/person";

  @override
  Future<Person> login(Credentials credentials) async {
    try {
      final responseData = await httpService.get(
        '$path/email/${credentials.email}/pass/${credentials.password}',
      );
      return Person.fromJson(responseData);
    } on Exception catch (e) {
      throw Exception("Invalid credentials");
    }
  }

  @override
  Future<bool> register(Person personRegistered) async {
    try {
      final responseData = await httpService.post('$path/create',
          data: personRegistered.toJson());
      return true;
    } on Exception catch (e) {
      print(e);
    }
    return false;
  }
}
