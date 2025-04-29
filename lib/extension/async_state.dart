import 'package:nexquub/utils/utils.dart';

extension AsyncStateExt<T> on AsyncState<T> {
  Widget when({
    required FutureSignal<T> signalState,
    required AsyncDataBuilder<Widget, T> data,
    bool isSliver = false,
    Widget? loading,
    Widget? emptyScreen,
    Widget Function(Object, StackTrace)? errorWidget,
    bool maintainState = false,
  }) {
    late Widget loadIndicator;
    if (loading != null) {
      loadIndicator = loading;
    } else if (isSliver) {
      loadIndicator = const SliverToBoxAdapter(
        child: CircularProgressIndicator(),
      );
    } else {
      loadIndicator = const CircularProgressIndicator();
    }
    if (isRefreshing || isReloading) {
      if (maintainState && hasValue) {
        return data(value as T);
      }
      return loadIndicator;
    }
    if (hasValue) {
      if (value is List && (value as List).isEmpty) {
        return emptyScreen ?? EmptyContent();
      }
      return data(value as T);
    }
    if (hasError) {
      if (errorWidget != null) {
        return errorWidget(error!, stackTrace!);
      }
      if (isSliver) {
        return SliverToBoxAdapter(
          child: ErrorScreen(
            error: error!,
            signal: signalState,
            trace: stackTrace!,
          ),
        );
      }
      return ErrorScreen(
        error: error!,
        signal: signalState,
        trace: stackTrace!,
      );
    }

    return loadIndicator;
  }
}
