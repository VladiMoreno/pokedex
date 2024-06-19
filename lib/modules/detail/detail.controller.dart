import 'package:get/get.dart';

import 'detail.services.dart';

class DetailController extends GetxController {
  final DetailServices detailServices = DetailServices();

  var isLoading = RxBool(false);
}
