import 'package:app_bienestar_universitario/src/core/routes/routes.dart';
import 'package:app_bienestar_universitario/src/core/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  static const pageRoute = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SafeArea(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  ServiceTitleWidget(
                    title: "Sede Santa Ana",
                    image: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset("assets/images/natacionLogo.png",
                          fit: BoxFit.fitHeight),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, Pages.createBooking.value),
                  ),
                  ServiceTitleWidget(
                    title: "Asesoría Psicológica",
                    image: Image.asset("assets/images/psicologiaLogo.png",
                        fit: BoxFit.fitHeight),
                    onTap: () => showSnackBarInProgress(context),
                  ),
                  ServiceTitleWidget(
                    title: "Reservas realizadas",
                    image: const Icon(
                      Icons.event_available,
                      size: 50,
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, Pages.listBookings.value),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Image.asset(
                  "assets/images/logoBlue.png",
                ))
          ],
        ),
      ),
    );
  }
}

class ServiceTitleWidget extends StatelessWidget {
  const ServiceTitleWidget(
      {Key? key, required this.image, required this.title, this.onTap})
      : super(key: key);
  final Widget image;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: theme.primaryColorDark),
          ),
          child: Row(
            children: [
              SizedBox(width: 100, height: 52, child: image),
              Expanded(
                  child: Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500))),
              const SizedBox(width: 20)
            ],
          ),
        ),
      ),
    );
  }
}
