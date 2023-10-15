import 'dart:async';

class AutoStream<T> {
  late final StreamController<T> _controller;
  late final T Function() producer;
  Timer? _timer;
  Duration duration;

  AutoStream(this.producer, this.duration, {bool feed = false}) {
    _controller = StreamController.broadcast(
      onListen: () {
        _initTimer();
      },
      onCancel: () {
        _timer?.cancel();
        _timer = null;
      },
    );

    if (feed) {
      _controller.add(producer());
    }
  }

  void _initTimer() {
    _timer ??= Timer.periodic(duration, (_) {
      _controller.add(producer());
    });
  }

  void updateTimerDuration(Duration newDuration, {bool feed = false}) {
    duration = newDuration;
    if (_timer != null) {
      _timer!.cancel();
    }

    _initTimer();

    if (feed) {
      _controller.add(producer());
    }
  }

  Stream<T> get stream => _controller.stream;
}
