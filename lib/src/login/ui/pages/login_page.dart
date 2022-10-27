import 'package:app_bienestar_universitario/src/core/widgets/rounded_button.dart';
import 'package:app_bienestar_universitario/src/login/providers/login_provider.dart';
import 'package:app_bienestar_universitario/src/login/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  static const pageRoute = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: theme.dividerColor)),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: theme.primaryColorDark,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(height: 20),
                AppTextField(
                    icon: const Icon(Icons.email_outlined),
                    labelText: "Email",
                    onChange: provider.setEmail),
                const SizedBox(height: 20),
                AppTextField(
                  icon: const Icon(Icons.password_outlined),
                  labelText: "Password",
                  onChange: provider.setPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                RoundedButton(
                  onTap: provider.loading
                      ? null
                      : () async {
                          provider.login(context);
                        },
                  content: "NEXT",
                  width: double.infinity,
                  color: theme.primaryColorDark,
                  textColor: theme.primaryColorLight,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
