import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';
import 'package:flutter16_movierec/Core/widgets/primary_button.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/list_card.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_flow_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'genre.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen(
      {Key? key,})
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
              'Let\'s start with a genre',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(vertical: kListItemSpacing),
                    itemCount: ref.watch(movieFlowControllerProvider).genres.length,
                    itemBuilder: (context, index) {
                      final genre = ref.watch(movieFlowControllerProvider).genres[index];
                      return ListCard(
                        genre: genre,
                        onTap: () => ref.read(movieFlowControllerProvider.notifier).toggleSelected(genre),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: kListItemSpacing,);
                    },
                   )),
            PrimaryButton(
                onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage,
                text: 'Continue',
                width: 150),
            const SizedBox(
              height: kMediumSpacing,
            )
          ],
        ),
      ),
    );
  }
}
