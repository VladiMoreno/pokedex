import 'package:flutter/material.dart';
import 'package:pokedex/config/env.config.dart';
import 'package:pokedex/modules/detail/dtos/pokemon_evolution.dto.dart';
import 'package:pokedex/utils/get_size.util.dart';
import 'package:pokedex/utils/image.util.dart';

class EvolutionInfoView extends StatelessWidget {
  final PokemonEvolutionDTO evolutionInfo;

  const EvolutionInfoView({
    super.key,
    required this.evolutionInfo,
  });

  List<Map<String, dynamic>> getEvolutionChain(ChainDetailDTO chainLink) {
    List<Map<String, dynamic>> evolutionChain = [];

    evolutionChain.add({
      'name': chainLink.species.name,
      'id': chainLink.species.id,
      'minLevel': 0,
    });

    for (var evolvesTo in chainLink.evolvesTo) {
      evolutionChain.addAll(getEvolutionChainRecursive(evolvesTo));
    }

    return evolutionChain;
  }

  List<Map<String, dynamic>> getEvolutionChainRecursive(
    EvolvesToDTO evolvesTo,
  ) {
    List<Map<String, dynamic>> evolutionChain = [];

    evolutionChain.add({
      'name': evolvesTo.species.name,
      'id': evolvesTo.species.id,
      'minLevel': evolvesTo.evolutionDetails.isNotEmpty
          ? evolvesTo.evolutionDetails.first.minLevel
          : 0,
    });

    for (var nextEvolvesTo in evolvesTo.evolvesTo) {
      evolutionChain.addAll(getEvolutionChainRecursive(nextEvolvesTo));
    }

    return evolutionChain;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> evolutionChain = getEvolutionChain(
      evolutionInfo.chain,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(evolutionChain.length - 1, (index) {
        final currentSpecies = evolutionChain[index];
        final nextSpecies = evolutionChain[index + 1];

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: GetSize.width * .3,
                child: Column(
                  children: [
                    ImageUtils.networkImage(
                      url: '$baseGifUrl/${currentSpecies['id']}.gif',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentSpecies['name'].toString().toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: GetSize.width * .3,
                child: Column(
                  children: [
                    const Icon(Icons.arrow_forward),
                    Text(
                      'Level ${nextSpecies['minLevel'].toString()}',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: GetSize.width * .3,
                child: Column(
                  children: [
                    ImageUtils.networkImage(
                      url: '$baseGifUrl/${nextSpecies['id']}.gif',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      nextSpecies['name'].toString().toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
