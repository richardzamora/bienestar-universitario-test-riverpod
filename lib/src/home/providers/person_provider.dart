import 'package:app_bienestar_universitario/src/home/models/campus.dart';
import 'package:app_bienestar_universitario/src/login/models/person.dart';
import 'package:app_bienestar_universitario/src/offered_services/models/offered_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personProvider = Provider<PersonProvider>((_) => PersonProvider());

class PersonProvider {
  Person? person;
  Campus campus = Campus(id: 1, name: "Santa Ana", address: "Salado");
  OfferedService? offeredService;
  DateTime? day;
  DateTime? hour;

  List<DateTime> get listHours => [
        DateTime(2022, 1, 1, 7),
        DateTime(2022, 1, 1, 8),
        DateTime(2022, 1, 1, 9),
        DateTime(2022, 1, 1, 10),
        DateTime(2022, 1, 1, 11),
        DateTime(2022, 1, 1, 12),
        DateTime(2022, 1, 1, 13),
        DateTime(2022, 1, 1, 14),
        DateTime(2022, 1, 1, 15),
        DateTime(2022, 1, 1, 16),
        DateTime(2022, 1, 1, 17),
      ];
}
