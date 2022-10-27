import 'package:app_bienestar_universitario/src/core/widgets/option_widget.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:app_bienestar_universitario/src/offered_services/providers/offered_services_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfferedServicesList extends StatefulHookConsumerWidget {
  const OfferedServicesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OfferedServicesListState();
}

class _OfferedServicesListState extends ConsumerState<OfferedServicesList> {
  @override
  Widget build(BuildContext context) {
    final personProv = ref.watch(personProvider);
    final offeredServicesAsync = ref.watch(offeredServicesProvider);
    return offeredServicesAsync.when(
      data: (data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: List.generate(
                  (data.length / 2).round(),
                  (index) => OptionWidget(
                      isSelected: personProv.offeredService == data[index * 2],
                      onTap: () {
                        personProv.offeredService = data[index * 2];
                        setState(() {});
                      },
                      content: data[index * 2].name ?? "upss")),
            ),
            Column(
              children: List.generate(
                  data.length ~/ 2,
                  (index) => OptionWidget(
                      isSelected:
                          personProv.offeredService == data[index * 2 + 1],
                      onTap: () {
                        personProv.offeredService = data[index * 2 + 1];
                        setState(() {});
                      },
                      content: data[index * 2 + 1].name ?? "upss"))
                ..addAll([
                  if (data.length % 2 == 1)
                    Opacity(
                        opacity: 0,
                        child: OptionWidget(
                            isSelected: false, onTap: () {}, content: ""))
                ]),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return Container();
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}
