import 'package:flutter/material.dart';
import 'package:pokedex/utils/get_size.util.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: GetSize.height,
        minWidth: GetSize.width,
      ),
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/gifs/pokeball.gif',
          width: GetSize.width * .5,
        ),
      ),
    );
  }
}
