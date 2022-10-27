import 'package:app_bienestar_universitario/src/bookings/models/booking.dart';
import 'package:app_bienestar_universitario/src/bookings/repositories/booking_repository.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listBookingsProvider = FutureProvider<List<Booking>>(
  (ref) {
    final myBookingRepository = ref.watch(bookingRepository);
    final myPersonProvider = ref.watch(personProvider);
    return myBookingRepository.listBooking(myPersonProvider.person!.id!);
  },
);
