import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail.controller.dart';

class DetailView extends StatefulWidget {
  DetailView({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
