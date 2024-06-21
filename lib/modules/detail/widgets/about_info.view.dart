import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/config/env.config.dart';
import 'package:pokedex/utils/get_size.util.dart';
import 'package:pokedex/utils/image.util.dart';

import '../dtos/Pokemon.dto.dart';
import '../dtos/pokemon_species.dto.dart';

class AboutInfoView extends StatelessWidget {
  final PokemonInformation pokemonInfo;
  final PokemonSpeciesDTO specieInfo;

  const AboutInfoView({
    super.key,
    required this.pokemonInfo,
    required this.specieInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
              width: GetSize.width * .5,
              child: Column(
                children: [
                  ImageUtils.networkImage(
                    url: '$baseGifUrl/${pokemonInfo.id}.gif',
                  ),
                  SizedBox(
                    width: GetSize.width * .5,
                    child: const AutoSizeText(
                      'Front animated sprite',
                      maxLines: 2,
                      minFontSize: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: GetSize.width * .5,
              child: Column(
                children: [
                  ImageUtils.networkImage(
                    url: '$baseGifUrl/shiny/${pokemonInfo.id}.gif',
                  ),
                  SizedBox(
                    width: GetSize.width * .5,
                    child: const AutoSizeText(
                      'Front animated shiny sprite',
                      maxLines: 2,
                      minFontSize: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: GetSize.width * .86,
            minHeight: 100,
          ),
          margin: EdgeInsets.all(GetSize.width * .07),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Egg Groups',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                            specieInfo.eggGroups.length,
                            (index) {
                              final info = specieInfo.eggGroups[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Text(
                                  info.name,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Catch rate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${specieInfo.captureRate.toString()}%",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Base friendship',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          specieInfo.baseHappiness.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Base Exp.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          pokemonInfo.baseExperience.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Habitat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(specieInfo.habitat.name),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Growth rate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          specieInfo.growthRate.name,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'weight',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${(pokemonInfo.weight / 10).toString()} kg",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Height',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${(pokemonInfo.height / 10).toString()} m",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Generation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          specieInfo.generation.name,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: GetSize.width * .4,
                    child: Column(
                      children: [
                        const Text(
                          'Abilities',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: List<Widget>.generate(
                            pokemonInfo.abilities.length,
                            (index) {
                              final info = pokemonInfo.abilities[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Text(
                                  info.ability.name,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
