import 'package:app_bienestar_universitario/src/bookings/models/booking.dart';
import 'package:app_bienestar_universitario/src/bookings/repositories/http_booking_repository.dart';
import 'package:app_bienestar_universitario/src/core/services/http/http_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookingRepository = Provider<BookingRepository>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return HttpBookingRepository(httpService);
});

abstract class BookingRepository {
  String get path;

  Future<bool> createBooking(Booking booking);

  Future<List<Booking>> listBooking(int personId);
}
