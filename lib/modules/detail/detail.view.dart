import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/styles/colors.style.dart';
import 'package:pokedex/common/styles/white_pokeball.style.dart';
import 'package:pokedex/common/widgets/layout.view.dart';
import 'package:pokedex/common/widgets/loading.view.dart';
import 'package:pokedex/config/env.config.dart';
import 'package:pokedex/utils/get_size.util.dart';
import 'package:pokedex/utils/image.util.dart';

import 'dtos/Pokemon.dto.dart';
import 'dtos/pokemon_evolution.dto.dart';
import 'dtos/pokemon_species.dto.dart';

import 'widgets/about_info.view.dart';
import 'widgets/stats_info.view.dart';
import 'widgets/evolution_info.view.dart';

import 'detail.controller.dart';

class DetailView extends StatefulWidget {
  DetailView({super.key});

  final DetailController controller = DetailController();

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> with TickerProviderStateMixin {
  late AnimationController animationController;
  int optionSelected = 1;

  @override
  void initState() {
    super.initState();
    widget.controller.onReady();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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

        return LayoutView(
          screenToShow: Container(
            constraints: BoxConstraints(
              minHeight: GetSize.height,
              maxWidth: GetSize.width,
            ),
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    minWidth: GetSize.width,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    color: pokemonItem(pokemonInfo.types[0].type.name),
                  ),
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: GetSize.width,
                    minHeight: GetSize.height * .45,
                  ),
                  margin: const EdgeInsets.only(top: 50),
                  color: pokemonItem(pokemonInfo.types[0].type.name),
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: GetSize.width * .5,
                            margin: const EdgeInsets.only(left: 15),
                            child: AutoSizeText(
                              pokemonInfo.name.toUpperCase(),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: pokemonInfo.types.map((type) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(38),
                                color: const Color.fromARGB(200, 232, 222, 222),
                              ),
                              child: SizedBox(
                                child: AutoSizeText(
                                  type.type.name,
                                  maxLines: 1,
                                  minFontSize: 12,
                                  maxFontSize: 18,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: GetSize.height * .1),
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: animationController.value * 2 * pi,
                        child: CustomPaint(
                          size: const Size(200, 200),
                          painter: PokeballLogoPainter(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: GetSize.width,
                    minHeight: GetSize.height * .65,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                    ),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: GetSize.height * .43),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                optionSelected = 1;
                              });
                            },
                            child: Container(
                              width: GetSize.width * .32,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: optionSelected == 1
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              child: Text(
                                'About',
                                style: TextStyle(
                                  color: optionSelected == 1
                                      ? Colors.blue
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: GetSize.width * .01),
                          InkWell(
                            onTap: () {
                              setState(() {
                                optionSelected = 2;
                              });
                            },
                            child: Container(
                              width: GetSize.width * .325,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: optionSelected == 2
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Stats',
                                style: TextStyle(
                                  color: optionSelected == 2
                                      ? Colors.blue
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: GetSize.width * .01),
                          InkWell(
                            onTap: () {
                              setState(() {
                                optionSelected = 3;
                              });
                            },
                            child: Container(
                              width: GetSize.width * .33,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: optionSelected == 3
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Evolutions',
                                style: TextStyle(
                                  color: optionSelected == 3
                                      ? Colors.blue
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          if (optionSelected == 1) ...[
                            AboutInfoView(
                              pokemonInfo: pokemonInfo,
                              specieInfo: specieInfo,
                            ),
                          ],
                          if (optionSelected == 2) ...[
                            StatsInfoView(
                              pokemonInfo: pokemonInfo,
                            ),
                          ],
                          if (optionSelected == 3) ...[
                            EvolutionInfoView(evolutionInfo: evolutionInfo),
                          ],
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: GetSize.height * .12),
                  child: ImageUtils.networkImage(
                    url: '$baseImgUrl/${pokemonInfo.id}.png',
                    width: GetSize.width > 500 ? 260 : GetSize.width * .55,
                  ),
                )
              ],
            ),
          ),
        );
      });
    });
  }
}
