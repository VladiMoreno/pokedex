import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/widgets/loading.view.dart';

import 'dtos/Pokemon.dto.dart';
import 'dtos/pokemon_evolution.dto.dart';
import 'dtos/pokemon_species.dto.dart';

import 'detail.controller.dart';

class DetailView extends StatefulWidget {
  DetailView({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Obx(() {
        if (widget.controller.isLoading.isTrue ||
            widget.controller.pokemonInfo.isEmpty ||
            widget.controller.pokemonSpecieInfo.isEmpty ||
            widget.controller.pokemonEvolutionInfo.isEmpty) {
          return const LoadingView();
        }

        PokemonInformation pokemonInfo = PokemonInformation.fromJson(
          Map<String, dynamic>.from(widget.controller.pokemonInfo),
        );

        PokemonSpeciesDTO specieInfo = PokemonSpeciesDTO.fromJson(
          Map<String, dynamic>.from(widget.controller.pokemonSpecieInfo),
        );

        PokemonEvolutionDTO evolutionInfo = PokemonEvolutionDTO.fromJson(
          Map<String, dynamic>.from(widget.controller.pokemonEvolutionInfo),
        );

        return Placeholder();
      });
    });
  }
}
