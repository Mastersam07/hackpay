import 'package:flutter/material.dart';

import 'view_state_enum.dart';

export 'failure.dart';
export 'view_state_enum.dart';

abstract class HackyViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  bool _disposed = false;

  ViewState get viewState => _viewState;
  bool get hasEncounteredError =>
      _viewState == ViewState.error || _viewState == ViewState.noConnection;
  bool get isBusy => _viewState == ViewState.busy;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  @protected
  Map<String, dynamic>? arguments;

  @mustCallSuper
  void initialise(Map<String, dynamic>? arguments) {
    this.arguments = arguments;
  }

  // @protected
  void setState([ViewState? viewState]) {
    if (viewState != null) _viewState = viewState;
    if (!_disposed && hasListeners) notifyListeners();
  }
}
