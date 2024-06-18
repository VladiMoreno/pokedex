import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/config/env.config.dart';

import 'home.dto.dart';
import 'home.controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List data = widget.controller.pokemonsInfo;

    return Obx(() {
      if (widget.controller.isLoading.isTrue || data.isEmpty) {
        return const Placeholder();
      }

      List<ResultsDTO> pokemons =
          data.map((e) => ResultsDTO.fromJson(e)).toList();

      return Wrap(
        children: List.generate(pokemons.length, (index) {
          return SizedBox(
            child: Image.network('$baseImgUrl/${pokemons[index].id}.png'),
          );
        }),
      );
    });
  }
}
