import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String content;
  final VoidCallback? onTap;
  final double borderRadius;
  final double width;
  final double height;
  final Color? borderColor;
  const RoundedButton({
    Key? key,
    this.color,
    this.textColor,
    required this.content,
    this.onTap,
    this.borderRadius = 20,
    this.width = 160,
    this.height = 50,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: color ?? theme.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 2)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
                child: Text(content,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: textColor ?? theme.primaryColorDark))),
          ),
        ),
      ),
    );
  }
}
