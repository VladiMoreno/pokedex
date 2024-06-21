import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/common/styles/white_pokeball.style.dart';
import 'package:pokedex/common/widgets/layout.view.dart';
import 'package:pokedex/common/widgets/loading.view.dart';
import 'package:pokedex/config/env.config.dart';
import 'package:pokedex/utils/get_size.util.dart';
import 'package:pokedex/utils/image.util.dart';

import 'type.dto.dart';
import 'type.controller.dart';

class TypeView extends StatefulWidget {
  TypeView({super.key});

  final TypeController controller = Get.put(TypeController());

  @override
  State<TypeView> createState() => _TypeViewState();
}

class _TypeViewState extends State<TypeView> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = GetSize.width * .8;
    double containerHeight = containerWidth * .5;

    List data = widget.controller.typesInfo;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          if (widget.controller.isLoading.isTrue && data.isEmpty) {
            return const LoadingView();
          }

          List<TypeDTO> types = data.map((e) => TypeDTO.fromJson(e)).toList();

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
                  types.length,
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
                                  types[index].name,
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
                                child: ImageUtils.networkImage(
                                  url: "$typeImgUrl/${types[index].name}.png",
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
