import 'package:nexquub/utils/utils.dart';

abstract class NetworkBoundResources {
  Future<T?> networkBoundNullableResponse<T>({
    required Future<T> fromRemote,
    Future<void> Function(T response)? onRemoteDataFetched,
    bool showErrorModal = true,
  }) async {
    try {
      final response = await fromRemote;
      onRemoteDataFetched?.call(response);
      return response!;
    } catch (error, trace) {
      if (showErrorModal) {
        showFormattedError(error: error, trace: trace);
      }
      return null;
    }
  }

  Future<T> networkBoundResponse<T>({
    required Future<ApiResponse<T>> fromRemote,
    Future<void> Function(T response)? onRemoteDataFetched,
  }) async {
    final response = await fromRemote;
    onRemoteDataFetched?.call(response.data);
    return response.data!;
  }
}
