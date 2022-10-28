import 'package:app_bienestar_universitario/src/bookings/models/booking.dart';
import 'package:app_bienestar_universitario/src/bookings/repositories/booking_repository.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookingProvider = Provider<BookingProvider>(
  (ref) {
    final myBookingRepository = ref.watch(bookingRepository);
    final myPersonProvider = ref.watch(personProvider);
    return BookingProvider(myBookingRepository, myPersonProvider);
  },
);

class BookingProvider {
  BookingRepository bookingRepository;
  PersonProvider personProvider;

  BookingProvider(this.bookingRepository, this.personProvider);

  bool loading = false;
  Future<bool> createBooking() async {
    if (!loading &&
        personProvider.day != null &&
        personProvider.hour != null &&
        personProvider.offeredService != null) {
      loading = true;
      final booking = Booking(
          date: DateTime(personProvider.day!.year, personProvider.day!.month,
              personProvider.day!.day, personProvider.hour!.hour),
          personId: personProvider.person,
          offeredServiceId: personProvider.offeredService,
          id: 1000);
      bool result = await bookingRepository.createBooking(booking);
      personProvider.day = null;
      personProvider.hour = null;
      personProvider.offeredService = null;
      loading = false;
      return result;
    }
    return false;
  }

  Future<bool> deleteBooking(int bookingId) {
    return bookingRepository.deleteBooking(bookingId);
  }
}
