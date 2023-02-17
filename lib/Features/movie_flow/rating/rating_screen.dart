import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';
import 'package:flutter16_movierec/Core/widgets/primary_button.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_flow_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingScreen extends ConsumerWidget  {
   RatingScreen(
      {Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Select a minimum rating\nranging from 1-10',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).rating}',
                  style: theme.textTheme.headline2,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 62,
                ),
              ],
            ),
            const Spacer(),
            Slider(
                value: double.parse(ref.watch(movieFlowControllerProvider).rating.toString()),
                min: 1,
                max: 10,
                divisions: 9,
                label: '${ref.watch(movieFlowControllerProvider).rating}',
                onChanged: (svalue) {
                  ref.read(movieFlowControllerProvider.notifier).updateRating(svalue.toInt());
                }),
            const Spacer(),
            PrimaryButton(
                onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage, text: 'Yes Please', width: 150),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
