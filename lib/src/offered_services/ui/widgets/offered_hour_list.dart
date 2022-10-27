import 'package:app_bienestar_universitario/src/core/widgets/option_widget.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class OfferedHourList extends StatefulHookConsumerWidget {
  const OfferedHourList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OfferedHourListState();
}

class _OfferedHourListState extends ConsumerState<OfferedHourList> {
  @override
  Widget build(BuildContext context) {
    final personProv = ref.watch(personProvider);
    final data = personProv.listHours;
    final now = DateTime.now();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: List.generate(
              (data.length / 2).round(),
              (index) => OptionWidget(
                  height: 30,
                  isSelected: personProv.hour == data[index * 2],
                  onTap: () {
                    personProv.hour = data[index * 2];
                    setState(() {});
                  },
                  content: DateFormat('kk:mm').format(data[index * 2]))),
        ),
        Column(
          children: List.generate(
              data.length ~/ 2,
              (index) => OptionWidget(
                  height: 30,
                  isSelected: personProv.hour == data[index * 2 + 1],
                  onTap: () {
                    personProv.hour = data[index * 2 + 1];
                    setState(() {});
                  },
                  content: DateFormat('kk:mm').format(data[index * 2 + 1])))
            ..addAll([
              if (data.length % 2 == 1)
                Opacity(
                    opacity: 0,
                    child: OptionWidget(
                        height: 30,
                        isSelected: false,
                        onTap: () {},
                        content: ""))
            ]),
        ),
      ],
    );
  }
}
