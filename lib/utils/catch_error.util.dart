import 'package:dio/dio.dart';
import 'package:pokedex/constants/error_message.constants.dart';
import 'package:pokedex/constants/type_notification.constants.dart';
import 'package:pokedex/utils/show_notification.util.dart';

class CatchErrorManagement {
  dynamic error;
  Function? function;
  String? messageToShow;

  CatchErrorManagement({
    required this.error,
    this.function,
    this.messageToShow,
  }) {
    String message = '';

    if (error is DioException) {
      if (error.type == DioExceptionType.connectionError) {
        message = messageToShow ?? connectionErrorMessage;
      } else if (error.type == DioExceptionType.badResponse) {
        message = error.message ?? badResponseMessage;
      } else if (error.type == DioExceptionType.cancel) {
        message = messageToShow ?? cancelMessage;
      } else {
        message = messageToShow ?? dioExceptionMessage;
      }
    } else {
      message = messageToShow ?? exceptionErrorMessage;
    }

    Notifications(
      typeProcess: TypeNotification.notificationWithFunctionToDo,
      typeNotification: 'error',
      titleNotification: 'Error!',
      textNotification: message,
      functionToDo: () => function != null ? function!() : () {},
    );
  }
}
