import 'package:app_bienestar_universitario/src/offered_services/models/offered_service.dart';
import 'package:app_bienestar_universitario/src/offered_services/repositories/offered_service_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final offeredServicesProvider = FutureProvider<List<OfferedService>>(
  (ref) async {
    final offeredServiceRepo = ref.watch(offeredServiceRepository);
    return offeredServiceRepo.getAllOfferedServices();
  },
);
