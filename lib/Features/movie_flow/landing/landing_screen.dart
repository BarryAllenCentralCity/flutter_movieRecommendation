import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';
import 'package:flutter16_movierec/Core/widgets/primary_button.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_flow_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerWidget{
  const LandingScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Let's find a movie", style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,),
            const Spacer(),
            Image.network('https://media.istockphoto.com/id/638625882/vector/teen-in-cinema.jpg?s=612x612&w=0&k=20&c=kQOnh8GGkeL23O0UVFBnBIxZshh-VSzkf1TKjVvFLE8='),
            const Spacer(),
            PrimaryButton(onPressed: ref.read(movieFlowControllerProvider.notifier).nextPage, text: 'Get Started',),
            const SizedBox(height: kMediumSpacing,)
          ],
        ),
      ),
    );
  }
}
