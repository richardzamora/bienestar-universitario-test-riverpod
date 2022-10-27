import 'package:app_bienestar_universitario/src/core/routes/routes.dart';
import 'package:app_bienestar_universitario/src/core/widgets/snackbar.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:app_bienestar_universitario/src/login/models/credentials.dart';
import 'package:app_bienestar_universitario/src/login/models/person.dart';
import 'package:app_bienestar_universitario/src/login/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = Provider<LoginProvider>(
  (ref) {
    final loginRepository = ref.watch(loginRepositoryProvider);
    final myPersonProvider = ref.watch(personProvider);
    return LoginProvider(loginRepository, myPersonProvider);
  },
);

class LoginProvider {
  LoginRepository loginRepository;
  PersonProvider personProvider;

  String _email = "";
  void setEmail(String newEmail) => _email = newEmail;
  String _password = "";
  void setPassword(String newPassword) => _password = newPassword;

  Person personRegistered = Person();

  LoginProvider(this.loginRepository, this.personProvider);

  bool loading = false;
  void login(BuildContext context) async {
    if (!loading) {
      loading = true;
      try {
        Person result = await loginRepository
            .login(Credentials(email: _email, password: _password));
        personProvider.person = result;
        _clearAndRedirectToHome(context);
      } on Exception catch (e) {
        showMySnackBar(context,
            message: "El nombre y o contraseña son incorrectos");
      } finally {
        loading = false;
      }
    }
  }

  void _clearAndRedirectToHome(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.popAndPushNamed(context, Pages.home.value);
  }

  void register(BuildContext context) async {
    if (!loading) {
      loading = true;
      try {
        bool result = await loginRepository.register(personRegistered);
        personProvider.person = personRegistered;
        Navigator.popUntil(context, (route) => route.isFirst);
      } on Exception catch (e) {
        showMySnackBar(context,
            message: "El nombre y o contraseña son incorrectos");
      } finally {
        loading = false;
      }
    }
  }
}
