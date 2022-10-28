import 'package:app_bienestar_universitario/src/core/widgets/option_widget.dart';
import 'package:app_bienestar_universitario/src/core/widgets/rounded_button.dart';
import 'package:app_bienestar_universitario/src/login/providers/login_provider.dart';
import 'package:app_bienestar_universitario/src/login/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  static const pageRoute = "/register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      "Register",
                      style: TextStyle(
                        color: theme.primaryColorDark,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 0.5,
                  width: double.infinity,
                  color: theme.primaryColorDark,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Que relación tienes con la U?",
                      style: TextStyle(
                        color: theme.primaryColorDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const SelectorUserTypeWidget(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 0.5,
                  width: double.infinity,
                  color: theme.primaryColorDark,
                ),
                AppTextField(
                    icon: const Icon(Icons.email_outlined),
                    labelText: "Email",
                    onChange: (value) =>
                        provider.personRegistered.email = value),
                const SizedBox(height: 20),
                AppTextField(
                  icon: const Icon(Icons.password_outlined),
                  labelText: "Password",
                  onChange: (value) =>
                      provider.personRegistered.password = value,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                AppTextField(
                    icon: const Icon(Icons.badge_outlined),
                    labelText: "Name",
                    onChange: (value) =>
                        provider.personRegistered.name = value),
                const SizedBox(height: 20),
                AppTextField(
                    icon: const Icon(Icons.badge_outlined),
                    labelText: "Last Name",
                    onChange: (value) =>
                        provider.personRegistered.lastName = value),
                const SizedBox(height: 20),
                AppTextField(
                    icon: const Icon(Icons.pin_outlined),
                    labelText: "Program Code",
                    keyboardType: TextInputType.number,
                    onChange: (value) => provider.personRegistered.id =
                        int.tryParse(value) ?? 1),
                const SizedBox(height: 20),
                RoundedButton(
                  onTap: provider.loading
                      ? null
                      : () async {
                          provider.register(context);
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

class SelectorUserTypeWidget extends StatefulHookConsumerWidget {
  const SelectorUserTypeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectorUserTypeWidgetState();
}

class _SelectorUserTypeWidgetState
    extends ConsumerState<SelectorUserTypeWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(loginProvider);
    final widthComponents = MediaQuery.of(context).size.width * 0.27;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OptionWidget(
              width: widthComponents,
              isSelected: provider.personRegistered.userType == "Estudiante",
              onTap: () {
                provider.personRegistered.userType = "Estudiante";
                setState(() {});
              },
              content: "Estudiante"),
          const SizedBox(width: 5),
          OptionWidget(
              width: widthComponents,
              isSelected: provider.personRegistered.userType == "Egresado",
              onTap: () {
                provider.personRegistered.userType = "Egresado";
                setState(() {});
              },
              content: "Egresado"),
          const SizedBox(width: 5),
          OptionWidget(
              width: widthComponents,
              isSelected: provider.personRegistered.userType == "Funcionario",
              onTap: () {
                provider.personRegistered.userType = "Funcionario";
                setState(() {});
              },
              content: "Funcionario"),
        ],
      ),
    );
  }
}
