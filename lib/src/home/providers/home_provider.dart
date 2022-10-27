import 'package:app_bienestar_universitario/src/home/models/campus.dart';
import 'package:app_bienestar_universitario/src/home/repositories/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = Provider<HomeProvider>(
  (ref) {
    final homeRepository = ref.watch(homeRepositoryProvider);
    return HomeProvider(homeRepository);
  },
);

class HomeProvider {
  HomeRepository homeRepository;
  late Campus campus;
  HomeProvider(this.homeRepository);
}
