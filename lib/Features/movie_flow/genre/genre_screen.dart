import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';
import 'package:flutter16_movierec/Core/widgets/primary_button.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/list_card.dart';
import 'genre.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen(
      {Key? key, required this.nextPage, required this.previousPage})
      : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Horror'),
    Genre(name: 'Anime'),
    Genre(name: 'Drama'),
    Genre(name: 'Romance'),
    Genre(name: 'Family'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
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
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      return ListCard(
                        genre: genre,
                        onTap: () => toggleSelected(genre),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: kListItemSpacing,);
                    },
                    itemCount: genres.length)),
            PrimaryButton(
                onPressed: widget.nextPage,
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
