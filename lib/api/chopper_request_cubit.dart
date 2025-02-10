import 'package:chopper/chopper.dart';
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';

abstract class ChopperRequestCubit<TRes, TOut>
    extends RequestCubit<Response<TRes>, TRes, TOut, Never> {
  ChopperRequestCubit(super.loggerTag);

  @override
  Future<RequestState<TOut, Never>> handleResult(Response<TRes> result) async {
    if (result case Response(statusCode: 200, body: final body?)) {
      logger.info('Request success. Data: ${result.body}');
      return RequestSuccessState(map(body));
    } else {
      logger.severe('Request error. Status code: ${result.statusCode}');
      try {
        return await handleError(RequestErrorState());
      } catch (e, s) {
        logger.severe(
          'Processing error failed. Exception: $e. Stack trace: $s',
        );
        return RequestErrorState(exception: e, stackTrace: s);
      }
    }
  }
}
