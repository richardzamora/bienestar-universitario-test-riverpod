import 'package:app_bienestar_universitario/src/core/widgets/option_widget.dart';
import 'package:app_bienestar_universitario/src/home/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectDayWidget extends StatefulHookConsumerWidget {
  const SelectDayWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectDayWidgetState();
}

class _SelectDayWidgetState extends ConsumerState<SelectDayWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(personProvider);
    final now =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final tomorrow = now.add(const Duration(days: 1));
    final nextTomorrow = now.add(const Duration(days: 2));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionWidget(
            isSelected:
                provider.day != null && provider.day!.isAtSameMomentAs(tomorrow)
                    ? true
                    : false,
            onTap: () {
              provider.day = tomorrow;
              setState(() {});
            },
            content: "${tomorrow.day}/${tomorrow.month}/${tomorrow.year}"),
        OptionWidget(
            isSelected: provider.day != null &&
                    provider.day!.isAtSameMomentAs(nextTomorrow)
                ? true
                : false,
            onTap: () {
              provider.day = nextTomorrow;
              setState(() {});
            },
            content:
                "${nextTomorrow.day}/${nextTomorrow.month}/${nextTomorrow.year}"),
      ],
    );
  }
}
