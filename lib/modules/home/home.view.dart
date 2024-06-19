import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/colors.style.dart';
import 'package:pokedex/common/layout.view.dart';
import 'package:pokedex/common/white_pokeball.style.dart';
import 'package:pokedex/config/env.config.dart';
import 'package:pokedex/utils/image.util.dart';

import 'home.dto.dart';
import 'home.controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  static const containerWidth = 290.00;
  static const containerHeight = containerWidth * .6;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          widget.controller.getMorePokemons();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List data = widget.controller.pokemonsInfo;

    return Obx(() {
      if (widget.controller.isLoading.isTrue && data.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      List<ResultsDTO> pokemons =
          data.map((e) => ResultsDTO.fromJson(e)).toList();

      return LayoutView(
        scrollView: false,
        screenToShow: NotificationListener<ScrollNotification>(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 20,
                    children: List.generate(pokemons.length, (index) {
                      return Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color:
                              pokemonItem(pokemons[index].types[0].type.name),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -15,
                                right: -3,
                                child: CustomPaint(
                                  size: const Size(
                                    containerWidth * .5,
                                    containerHeight * .8,
                                  ),
                                  painter: PokeballLogoPainter(
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 7, bottom: 20),
                                  child: SizedBox(
                                    width: containerWidth * .5,
                                    child: Hero(
                                      tag:
                                          "pokemon-image-${pokemons[index].id}",
                                      child: ImageUtils.networkImage(
                                        url:
                                            '$baseImgUrl/${pokemons[index].id}.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: containerWidth * .4,
                                      child: AutoSizeText(
                                        pokemons[index].name,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:
                                          pokemons[index].types.map((type) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(38),
                                              color: const Color.fromARGB(
                                                  200, 232, 222, 222),
                                            ),
                                            child: SizedBox(
                                              child: AutoSizeText(
                                                type.type.name,
                                                maxLines: 1,
                                                minFontSize: 12,
                                                maxFontSize: 18,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                if (widget.controller.isLoading.isTrue)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
