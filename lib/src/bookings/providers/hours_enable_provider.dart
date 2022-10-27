import 'package:app_bienestar_universitario/src/bookings/repositories/booking_repository.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hoursEnableProvider = FutureProvider<List<DateTime>>(
  (ref) async {
    final myBookingRepository = ref.watch(bookingRepository);
    final myPersonProvider = ref.watch(personProvider);
    if (myPersonProvider.day == null ||
        myPersonProvider.offeredService == null) {
      return [];
    }
    final bookings = await myBookingRepository.allBookings();
    var hours = myPersonProvider.listHours.toList();
    hours.removeWhere((element) {
      bool remove = false;
      for (var booking in bookings) {
        if (booking.offeredServiceId!.id! ==
            myPersonProvider.offeredService!.id!) {
          if (booking.date!.year == myPersonProvider.day!.year &&
              booking.date!.month == myPersonProvider.day!.month &&
              booking.date!.day == myPersonProvider.day!.day) {
            if (booking.date!.hour == element.hour) {
              return true;
            }
          }
        }
      }
      return remove;
    });
    return hours;
  },
);
