import 'package:dio/dio.dart';

class MainInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cancelToken = CancelToken();

    options.cancelToken = cancelToken;

    Future.delayed(const Duration(seconds: 10), () {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel('Solicitu cancelada debido al tiempo de espera.');
      }
    });

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      return super.onResponse(response, handler);
    }
    throw DioException(
      message: "Ah ocurrido un error en la respuesta del servidor",
      response: response,
      type: DioExceptionType.unknown,
      requestOptions: RequestOptions(),
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionError:
        return super.onError(
          DioException(
            message: "No se puede comunicar con el servidor",
            response: err.response,
            type: DioExceptionType.connectionError,
            requestOptions: RequestOptions(),
          ),
          handler,
        );
      case DioExceptionType.cancel:
        return super.onError(
          DioException(
            message: "El servidor se ha tardado mucho en responder",
            response: err.response,
            type: DioExceptionType.cancel,
            requestOptions: RequestOptions(),
          ),
          handler,
        );
      default:
        return super.onError(
          DioException(
            message: "Ha ocurrido en error",
            response: err.response,
            type: DioExceptionType.unknown,
            requestOptions: RequestOptions(),
          ),
          handler,
        );
    }
  }
}
