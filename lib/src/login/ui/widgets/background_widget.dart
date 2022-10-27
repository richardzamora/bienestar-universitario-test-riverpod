import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final widthScreen = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
            color: theme.primaryColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SizedBox(
                width: widthScreen * 0.5,
                child: Image.asset(
                  "assets/images/logoWhite.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            )),
        child,
      ],
    );
  }
}
