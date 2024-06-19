import 'package:flutter/material.dart';

Color pokemonItem(String type) {
  switch (type) {
    case 'normal':
      return const Color(0xFFA7A877);
    case 'fire':
      return const Color(0xFFFB6C6C);
    case 'water':
      return const Color(0xFF77BDFE);
    case 'grass':
      return const Color(0xFF48D0B0);
    case 'electric':
      return const Color(0xFFFFCE4B);
    case 'ice':
      return const Color(0xFF99D7D8);
    case 'fighting':
      return const Color(0xFFC03128);
    case 'poison':
      return const Color(0xFF9F419F);
    case 'ground':
      return const Color(0xFFE1C068);
    case 'flying':
      return const Color(0xFFA890F0);
    case 'psychic':
      return const Color(0xFFF95887);
    case 'bug':
      return const Color(0xFFA8B91F);
    case 'rock':
      return const Color(0xFFB8A038);
    case 'ghost':
      return const Color(0xFF705998);
    case 'dark':
      return const Color(0xFF6F5848);
    case 'dragon':
      return const Color(0xFF7138F8);
    case 'steel':
      return const Color(0xFFB8B8D0);
    case 'fairy':
      return const Color(0xFFA890F0);
    default:
      return Colors.grey;
  }
}
