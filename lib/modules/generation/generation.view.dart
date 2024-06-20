import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/styles/white_pokeball.style.dart';
import 'package:pokedex/common/widgets/layout.view.dart';
import 'package:pokedex/common/widgets/loading.view.dart';
import 'package:pokedex/utils/get_size.util.dart';
import 'package:pokedex/utils/image.util.dart';

import 'generation.controller.dart';
import 'generation.dto.dart';

class GenerationView extends StatefulWidget {
  GenerationView({super.key});

  final GeneartionController controller = Get.put(GeneartionController());

  @override
  State<GenerationView> createState() => _GenerationViewState();
}

class _GenerationViewState extends State<GenerationView> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = GetSize.width * .8;
    double containerHeight = containerWidth * .5;

    List data = widget.controller.generationsInfo;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          if (widget.controller.isLoading.isTrue && data.isEmpty) {
            return const LoadingView();
          }

          List<GenerationDTO> generations =
              data.map((e) => GenerationDTO.fromJson(e)).toList();

          return LayoutView(
            pageSelected: 1,
            screenToShow: Container(
              constraints: BoxConstraints(
                maxWidth: GetSize.width,
                minHeight: GetSize.height,
              ),
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.generate(
                  generations.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/generation/${index + 1}');
                      },
                      child: Container(
                        width: containerWidth,
                        height: containerHeight,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -15,
                                right: -3,
                                child: CustomPaint(
                                  size: Size(
                                    containerWidth * .35,
                                    containerHeight * .7,
                                  ),
                                  painter: PokeballLogoPainter(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              Container(
                                width: containerWidth - 20,
                                margin: EdgeInsets.only(
                                  top: containerHeight * .12,
                                ),
                                child: Text(
                                  generations[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Container(
                                width: containerWidth,
                                margin: EdgeInsets.only(
                                  top: containerHeight * .18,
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    generations[index].images.length,
                                    (indexImage) {
                                      final img =
                                          generations[index].images[indexImage];

                                      return ImageUtils.networkImage(
                                        url: img.url,
                                        width: containerWidth * .3,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
