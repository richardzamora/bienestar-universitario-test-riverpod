import 'package:app_bienestar_universitario/src/bookings/providers/booking_provider.dart';
import 'package:app_bienestar_universitario/src/bookings/ui/widgets/select_day_widget.dart';
import 'package:app_bienestar_universitario/src/core/widgets/rounded_button.dart';
import 'package:app_bienestar_universitario/src/core/widgets/snackbar.dart';
import 'package:app_bienestar_universitario/src/home/ui/pages/home_page.dart';
import 'package:app_bienestar_universitario/src/offered_services/ui/widgets/offered_hour_list.dart';
import 'package:app_bienestar_universitario/src/offered_services/ui/widgets/offered_services_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateBookingPage extends HookConsumerWidget {
  static const pageRoute = "/create-booking";
  const CreateBookingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(bookingProvider);
    final theme = Theme.of(context);
    String title = "uwu";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: theme.dividerColor)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ServiceTitleWidget(
                      title: "Sede Santa Ana",
                      image: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset("assets/images/natacionLogo.png",
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TitleContentWidget(title: "Seleccionar día"),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SelectDayWidget()),
            const TitleContentWidget(title: "Seleccionar servicio"),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: OfferedServicesList()),
            const TitleContentWidget(
              title: "Seleccionar hora",
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: OfferedHourList()),
            RoundedButton(
              content: "Reservar",
              color: theme.primaryColorDark,
              textColor: theme.primaryColorLight,
              onTap: () async {
                bool isCreated = await provider.createBooking();
                if (isCreated) {
                  Navigator.pop(context);
                  showMySnackBar(context,
                      message: "Fue agendado el servicio correctamente :D");
                }
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class TitleContentWidget extends StatelessWidget {
  const TitleContentWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), border: Border.all()),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
