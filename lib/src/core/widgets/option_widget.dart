import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.content,
    this.height = 40,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final String content;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(isSelected ? 0 : 2),
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelected ? theme.primaryColorDark : theme.dividerColor,
            width: isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Center(
            child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isSelected ? theme.primaryColorDark : theme.dividerColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        )),
      ),
    );
  }
}
