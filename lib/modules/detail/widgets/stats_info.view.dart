import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/utils/get_size.util.dart';

import '../dtos/Pokemon.dto.dart';

class StatsInfoView extends StatelessWidget {
  final PokemonInformation pokemonInfo;

  const StatsInfoView({
    super.key,
    required this.pokemonInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        pokemonInfo.stats.length,
        (index) {
          final info = pokemonInfo.stats[index];

          return Container(
            width: GetSize.width * .86,
            margin: EdgeInsets.all(GetSize.width * .07),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: GetSize.width * .3,
                  child: AutoSizeText(
                    info.stat.name.toUpperCase(),
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: GetSize.width * .1,
                  child: Text(info.baseStat.toString()),
                ),
                SizedBox(
                  width: GetSize.width * .4,
                  child: LinearProgressIndicator(
                    value: (info.baseStat / 120).clamp(0.0, 1.0),
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation(
                      Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
