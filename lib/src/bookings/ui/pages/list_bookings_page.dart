import 'package:app_bienestar_universitario/src/bookings/providers/booking_provider.dart';
import 'package:app_bienestar_universitario/src/bookings/providers/list_bookings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ListBookingsPage extends StatefulHookConsumerWidget {
  static const pageRoute = "/booking/list";
  const ListBookingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListBookingsPageState();
}

class _ListBookingsPageState extends ConsumerState<ListBookingsPage> {
  @override
  void initState() {
    super.initState();
    ref.refresh(listBookingsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final listBookingsAsync = ref.watch(listBookingsProvider);
    final bookingProv = ref.watch(bookingProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: theme.dividerColor)),
                  const Expanded(
                      child: Center(
                          child: Text(
                    "Reservas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))),
                ],
              ),
            ),
            Expanded(
                child: listBookingsAsync.when(
              data: (data) {
                if (data.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          data.length,
                          (index) => Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        "${data[index].date!.day}/${data[index].date!.month}/${data[index].date!.year}"),
                                    Text(DateFormat('kk:mm')
                                        .format(data[index].date!)),
                                    Text(data[index].offeredServiceId?.name ??
                                        ""),
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: IconButton(
                                          padding: new EdgeInsets.all(0.0),
                                          onPressed: () {
                                            bookingProv
                                                .deleteBooking(data[index].id!);
                                            ref.refresh(listBookingsProvider);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 20,
                                          )),
                                    )
                                  ],
                                ),
                              )),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No tienes reservas :("),
                  );
                }
              },
              error: (error, stackTrace) {
                return const Center(
                  child: Text("Ups ha ocurrido un error :("),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            )),
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
