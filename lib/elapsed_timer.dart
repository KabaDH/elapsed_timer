library elapsed_timer;

import 'dart:async';

/// A non-periodic timer which knows how long it's been running.
class ElapsedTimer implements Timer {
  /// Creates new ElapsedTimer
  ///
  /// Getter [elapsed] returns the duration of time since it was started
  ///
  /// Example:
  /// ```dart
  /// final timer =
  ///     ElapsedTimer(const Duration(seconds: 5), () => print('All done'));
  /// Future.delayed(const Duration(seconds: 1)).then((_) => print('Elapsed:'
  /// '${timer.elapsed}'));
  /// ```
  ElapsedTimer(Duration duration, void Function() callback)
      : _timer = Timer(duration, callback),
        _stopwatch = Stopwatch()..start();

  /// Inner timer to trigger the callback.
  final Timer _timer;

  /// Stopwatch to count running time
  final Stopwatch _stopwatch;

  @override
  bool get isActive => _timer.isActive;

  /// How long the timer has been running
  Duration get elapsed => _stopwatch.elapsed;

  @override
  void cancel() {
    _timer.cancel();
    _stopwatch.stop();
  }

  /// The count of intervals leading up to the latest timer event in the
  /// current countdown.
  @override
  int get tick => _timer.tick;
}