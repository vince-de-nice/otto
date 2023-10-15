import 'dart:async';

class AutoController<T> implements StreamController<T> {
  final StreamController<T> _controller;
  final Future<T> Function() _producer;
  Duration _streamSpeed;
  Timer? _timer;
  AutoController._(
      StreamController<T> controller, this._producer, this._streamSpeed)
      : _controller = controller {
    _controller.onListen = () => _initTimer();
    _controller.onCancel = () {
      _timer?.cancel();
      _timer = null;
    };
  }

  factory AutoController.fromAsyncProvider(
    Future<T> Function() producer,
    Duration streamSpeed,
  ) {
    return AutoController._(
        StreamController<T>.broadcast(), producer, streamSpeed);
  }

  void _initTimer() {
    _timer ??= Timer.periodic(_streamSpeed, (_) async {
      _controller.add(await _producer());
    });
  }

  @override
  FutureOr<void> Function()? get onCancel => _controller.onCancel;

  @override
  void Function()? get onListen => _controller.onResume;

  @override
  void Function()? get onPause => _controller.onPause;

  @override
  void Function()? get onResume => _controller.onResume;

  @override
  void add(T event) => _controller.add(event);

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      _controller.addError(error, stackTrace);

  @override
  Future addStream(Stream<T> source, {bool? cancelOnError}) =>
      _controller.addStream(source, cancelOnError: cancelOnError);

  @override
  Future close() => _controller.close();

  @override
  Future get done => _controller.done;

  @override
  bool get hasListener => _controller.hasListener;

  @override
  bool get isClosed => _controller.isClosed;

  @override
  bool get isPaused => _controller.isPaused;

  @override
  StreamSink<T> get sink => _controller.sink;

  @override
  Stream<T> get stream => _controller.stream;

  @override
  set onCancel(FutureOr<void> Function()? onCancel) {
    _controller.onCancel = () {
      _initTimer();
      _timer?.cancel();
      _timer = null;
      onCancel?.call();
    };
  }

  @override
  set onListen(void Function()? onListen) {
    _controller.onListen = () {
      _initTimer();
      onListen?.call();
    };
  }

  @override
  set onPause(void Function()? onPause) {
    _controller.onPause = onPause;
  }

  @override
  set onResume(void Function()? onResume) {
    _controller.onResume = onResume;
  }

  // @override
  // // TODO: implement stream
  // Stream<T> get stream => throw UnimplementedError();
  // late final T Function() producer;

  // Duration duration;

  // AutoStream(this.producer, this.duration, {bool feed = false}) {
  //   _controller = StreamController.broadcast(
  //     onListen: () {
  //       _initTimer();
  //     },
  //     onCancel: () {
  //       _timer?.cancel();
  //       _timer = null;
  //     },
  //   );

  //   if (feed) {
  //     _controller.add(producer());
  //   }
  // }

  // void updateTimerDuration(Duration newDuration, {bool feed = false}) {
  //   duration = newDuration;
  //   if (_timer != null) {
  //     _timer!.cancel();
  //   }

  //   _initTimer();

  //   if (feed) {
  //     _controller.add(producer());
  //   }
  // }

  // Stream<T> get stream => _controller.stream;
}
