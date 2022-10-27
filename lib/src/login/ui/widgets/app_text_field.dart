import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      required this.labelText,
      required this.onChange,
      required this.icon,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);

  final String labelText;
  final Function(String) onChange;
  final Widget icon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        icon,
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: TextField(
              onChanged: onChange,
              cursorColor: theme.dividerColor,
              keyboardType: keyboardType,
              style: TextStyle(color: theme.primaryColorDark),
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: theme.primaryColorDark, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: theme.primaryColorDark, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                    color: theme.primaryColorDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
