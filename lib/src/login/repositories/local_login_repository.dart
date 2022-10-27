import 'package:app_bienestar_universitario/src/login/models/credentials.dart';
import 'package:app_bienestar_universitario/src/login/models/person.dart';
import 'package:app_bienestar_universitario/src/login/repositories/login_repository.dart';

class LocalLoginRepository extends LoginRepository {
  @override
  Future<Person> login(Credentials credentials) async {
    if (credentials.email == "maria" && credentials.password == "password") {
      return Person(name: "maria", password: "password");
    }
    if (credentials.email == "pedro" && credentials.password == "123456") {
      return Person(name: "pedro", password: "123456");
    }
    throw Exception("Invalid credentials");
  }

  @override
  register(Person personRegistered) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
