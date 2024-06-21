import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static Widget networkImage(
      {required String url, double? height, double? width, Color? color}) {
    if (kIsWeb) {
      return Image.network(
        url,
        height: height,
        width: width,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/gifs/pokeball.gif',
            width: 100,
          );
        },
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      color: color,
      errorWidget: (context, error, stackTrace) {
        return Image.asset(
          'assets/gifs/pokeball.gif',
          width: width,
        );
      },
    );
  }
}
