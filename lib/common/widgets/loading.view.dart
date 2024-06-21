import 'package:flutter/material.dart';
import 'package:pokedex/utils/get_size.util.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/gifs/pokeball.gif',
        width: GetSize.width * .5,
      ),
    );
  }
}
