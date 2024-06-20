import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/styles/white_pokeball.style.dart';
import 'package:pokedex/common/widgets/layout.view.dart';
import 'package:pokedex/common/widgets/loading.view.dart';
import 'package:pokedex/utils/get_size.util.dart';

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
    double containerHeight = containerWidth * .6;

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
            scrollView: false,
            screenToShow: Container(
              constraints: BoxConstraints(
                maxWidth: GetSize.width,
                minHeight: GetSize.height,
              ),
              margin: const EdgeInsets.only(top: 25),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.generate(
                  generations.length,
                  (index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -15,
                                right: -3,
                                child: CustomPaint(
                                  size: Size(
                                    containerWidth * .5,
                                    containerHeight * .8,
                                  ),
                                  painter: PokeballLogoPainter(
                                    color: Colors.white.withOpacity(0.3),
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
