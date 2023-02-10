import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Core/constants.dart';
import 'package:flutter16_movierec/Core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const  LandingScreen({Key? key, required this.nextPage, required this.previousPage}) : super(key: key);

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Let's find a movie", style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center,),
            const Spacer(),
            Image.network('https://media.istockphoto.com/id/638625882/vector/teen-in-cinema.jpg?s=612x612&w=0&k=20&c=kQOnh8GGkeL23O0UVFBnBIxZshh-VSzkf1TKjVvFLE8='),
            const Spacer(),
            PrimaryButton(onPressed: nextPage, text: 'Get Started', width: 120.0,),
            const SizedBox(height: kMediumSpacing,)
          ],
        ),
      ),
    );
  }
}
