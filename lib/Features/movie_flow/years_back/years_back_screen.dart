import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';
import 'package:flutter16_movierec/Core/widgets/primary_button.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_flow_controller.dart';
import 'package:flutter16_movierec/Features/movie_flow/result/result_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Years Back',
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                )
              ],
            ),
            const Spacer(),
            Slider(
                value:
                    ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
                min: 0,
                max: 70,
                divisions: 70,
                label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
                onChanged: (svalue) {
                  ref
                      .read(movieFlowControllerProvider.notifier)
                      .updateYearsBack(svalue.toInt());
                }),
            const Spacer(),
            PrimaryButton(
                onPressed: () async {
                  await ref.read(movieFlowControllerProvider.notifier).getRecommendedMovies();
                  Navigator.of(context).push(ResultScreen.route());
                },
                isLoading: ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
                text: 'Amazing',
                width: 150),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
