import 'package:flutter/foundation.dart';
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
        return Container(
          constraints: BoxConstraints(
            maxWidth: GetSize.width,
          ),
          alignment: Alignment.topCenter,
          child: Scaffold(
            backgroundColor: Colors.amber,
            body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: GetSize.width,
                        maxHeight:
                            kIsWeb ? GetSize.height - 65 : GetSize.height - 100,
                      ),
                      alignment: Alignment.topCenter,
                      color: Colors.white,
                      child: widget.scrollView
                          ? SingleChildScrollView(
                              child: widget.screenToShow,
                            )
                          : widget.screenToShow,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: GetSize.width,
                      ),
                      height: 65,
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        currentIndex: widget.pageSelected,
                        onTap: (value) {
                          switch (value) {
                            case 0:
                              Get.toNamed('/home');
                              break;
                            case 1:
                              Get.toNamed('/generation');
                              break;
                            case 2:
                              Get.toNamed('/type');
                              break;
                            default:
                              Get.toNamed('/home');
                          }
                        },
                        items: const [
                          BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.house),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
                            label: 'All Generations',
                          ),
                          BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.list),
                            label: 'All Types',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
