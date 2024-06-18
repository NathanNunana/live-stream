import 'package:flutter/material.dart';
import 'package:aatv_mobile/states/_index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = ChangeNotifierProvider<StreamNotifier>(
  (ref) => StreamNotifier(),
);

class StreamNotifier extends ChangeNotifier {
  final StateContext _stateContext;

  StreamNotifier() : _stateContext = StateContext(LoadingState()) {
    _stateContext
        .addListener(notifyListeners); // Listen to changes in StateContext
    _stateContext.handle(); // Initial state handling
  }

  StateContext get stateContext => _stateContext;

  void reloadVideos() {
    _stateContext.handle();
  }
}
