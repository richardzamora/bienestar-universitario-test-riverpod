import 'package:app_bienestar_universitario/src/core/routes/routes.dart';
import 'package:app_bienestar_universitario/src/core/widgets/rounded_button.dart';
import 'package:app_bienestar_universitario/src/core/widgets/snackbar.dart';
import 'package:app_bienestar_universitario/src/login/ui/widgets/background_widget.dart';
import 'package:app_bienestar_universitario/src/login/ui/widgets/forgot_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  static const pageRoute = "/signIn";
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackgroundWidget(child: Container())),
          ),
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(color: theme.primaryColorLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton(
                    content: "LOG IN",
                    color: theme.primaryColorLight,
                    borderColor: theme.primaryColorDark,
                    onTap: () {
                      Navigator.pushNamed(context, Pages.login.value);
                    },
                  ),
                  RoundedButton(
                    content: "REGISTER",
                    color: theme.primaryColorDark,
                    textColor: theme.primaryColorLight,
                    onTap: () =>
                        Navigator.pushNamed(context, Pages.register.value),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
