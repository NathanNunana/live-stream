part of '_index.dart';

abstract class AppState {
  void handle(StateContext context);
}

class StateContext extends ChangeNotifier {
  AppState _state;

  StateContext(this._state);

  void setState(AppState state) {
    _state = state;
    handle();
  }

  AppState get state => _state;

  void handle() {
    Logger.log("Handling State", "");
    _state.handle(this);
    notifyListeners();
  }
}

class LoadingState implements AppState {
  final streamService = StreamService();
  @override
  void handle(StateContext context) {
    Logger.log("Loading State", "");
    streamService.fetchVideos().then(
      (stream) {
        context.setState(LoadedState(stream));
      },
    ).catchError((error) {
      context.setState(ErrorState(error.toString(), streamService));
    });
  }
}

class LoadedState implements AppState {
  final List<Video> streams;

  LoadedState(this.streams);

  @override
  void handle(StateContext context) {
    Logger.log("Loaded State", "$streams");
    // Handle loaded state behavior here if needed
  }
}

class ErrorState implements AppState {
  final String error;
  final StreamService streamService;

  ErrorState(this.error, this.streamService);

  @override
  void handle(StateContext context) {
    Logger.log("Error State", error);
    // showDialog(
    //   context:,
    //   builder: (BuildContext dialogContext) {
    //     return AlertDialog(
    //       title: const Text('Error'),
    //       content: Text(error),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(dialogContext).pop();
    //             // Retry button resets to LoadingState
    //             context.setState(LoadingState(streamService));
    //           },
    //           child: const Text('Retry'),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(dialogContext).pop();
    //           },
    //           child: const Text('Cancel'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
