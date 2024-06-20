import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pokemon_generation.controller.dart';

class PokemonGenerationView extends StatefulWidget {
  PokemonGenerationView({super.key});

  final PokemonGenerationController controller =
      Get.put(PokemonGenerationController());

  @override
  State<PokemonGenerationView> createState() => _PokemonGenerationViewState();
}

class _PokemonGenerationViewState extends State<PokemonGenerationView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
