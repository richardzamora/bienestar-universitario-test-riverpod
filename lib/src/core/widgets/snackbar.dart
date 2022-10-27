import 'package:flutter/material.dart';

SnackBar mySnackBar(
    {String message =
        "Ups, esta funcionalidad aún se encuentra en desarrollo"}) {
  return SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      elevation: 1,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ));
}

void showSnackBarInProgress(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(mySnackBar());
}

void showMySnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: message));
}
