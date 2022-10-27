import 'package:app_bienestar_universitario/src/bookings/ui/pages/create_booking_page.dart';
import 'package:app_bienestar_universitario/src/bookings/ui/pages/list_bookings_page.dart';
import 'package:app_bienestar_universitario/src/home/ui/pages/home_page.dart';
import 'package:app_bienestar_universitario/src/login/ui/pages/login_page.dart';
import 'package:app_bienestar_universitario/src/login/ui/pages/register_page.dart';
import 'package:app_bienestar_universitario/src/login/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  SignInPage.pageRoute: (BuildContext context) => const SignInPage(),
  LoginPage.pageRoute: (BuildContext context) => const LoginPage(),
  RegisterPage.pageRoute: (BuildContext context) => const RegisterPage(),
  HomePage.pageRoute: (BuildContext context) => const HomePage(),
  CreateBookingPage.pageRoute: (BuildContext context) =>
      const CreateBookingPage(),
  ListBookingsPage.pageRoute: (BuildContext context) =>
      const ListBookingsPage(),
};

enum Pages {
  singIn(SignInPage.pageRoute),
  login(LoginPage.pageRoute),
  register(RegisterPage.pageRoute),
  home(HomePage.pageRoute),
  createBooking(CreateBookingPage.pageRoute),
  listBookings(ListBookingsPage.pageRoute),
  ;

  const Pages(this.value);
  final String value;
}
