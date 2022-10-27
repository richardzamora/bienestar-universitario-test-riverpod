import 'package:app_bienestar_universitario/src/bookings/models/booking.dart';
import 'package:app_bienestar_universitario/src/bookings/repositories/booking_repository.dart';
import 'package:app_bienestar_universitario/src/core/services/http/http_service.dart';

class HttpBookingRepository extends BookingRepository {
  final HttpService httpService;
  HttpBookingRepository(this.httpService);

  @override
  String get path => "/booking";

  @override
  Future<bool> createBooking(Booking booking) async {
    try {
      final responseData =
          await httpService.post('$path/create', data: booking.toJson());
      return true;
    } on Exception catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Future<List<Booking>> listBooking(int personId) async {
    try {
      final responseData = await httpService.getAll(
        '$path/allBookings',
      );
      var list =
          List<Booking>.from(responseData.map((x) => Booking.fromJson(x)));
      list.removeWhere((element) => element.personId?.id != personId);
      return list;
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }

  @override
  Future<List<Booking>> allBookings() async {
    try {
      final responseData = await httpService.getAll(
        '$path/allBookings',
      );
      return List<Booking>.from(responseData.map((x) => Booking.fromJson(x)));
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }
}
