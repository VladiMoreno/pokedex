import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pokedex/utils/get_size.util.dart';

class LayoutView extends StatefulWidget {
  final Widget screenToShow;
  final int pageSelected;
  final bool scrollView;

  const LayoutView({
    super.key,
    required this.screenToShow,
    this.pageSelected = 0,
    this.scrollView = true,
  });

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: GetSize.width,
                  maxHeight: GetSize.height - 65,
                ),
                child: widget.scrollView
                    ? SingleChildScrollView(
                        child: widget.screenToShow,
                      )
                    : widget.screenToShow,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.pageSelected,
            onTap: (value) {
              switch (value) {
                case 0:
                  Get.toNamed('/home');
                  break;
                case 1:
                  Get.toNamed('/home');
                  break;
                case 2:
                  Get.toNamed('/home');
                  break;
                case 3:
                  Get.toNamed('/config');
                  break;
                default:
                  Get.toNamed('/home');
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.house),
                label: 'labelHome'.tr,
              ),
              BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.box),
                label: 'labelProduct'.tr,
              ),
              BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.truck),
                label: 'labelSupplier'.tr,
              ),
              BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.gear),
                label: 'labelConfig'.tr,
              ),
            ],
          ),
        );
      },
    );
  }
}
