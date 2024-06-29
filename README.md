## Features

This package targets the simplicity of accessing the elapsed time from the timer. A necessary 
Stopwatch for the 'elapsed' property is included in the ElapsedTimer, allowing you to:
```dart
final timer = ElapsedTimer(const Duration(seconds: 5), () => print('All done'));
// Somewhere in the code:
final elapsed = timer.elapsed;
```
instead of maintaining synchronization between the Timer and the corresponding Stopwatch:
```dart
final timer1 = Timer(const Duration(seconds: 5), () => print('All done'));
final stopwatchForTimer1 = StopWatch()..start();

// Somewhere in the code:
final elapsed = stopwatchForTimer1.elapsed;

// Somewhere in the code:
timer1.cancel();
stopwatchForTimer1.stop();
```
The 'elapsed' property for Timer is especially helpful when handling multiple asynchronous calls 
starting the same timer, as it helps to avoid throttling:

```dart
ElapsedTimer? updateTimer;

void updateData() {
  if (updateTimer != null && updateTimer!.isActive) {
    final runningFor = updateTimer!.elapsed;
    if (runningFor < Duration(seconds: 1)) {
      print('updateData is called already');
      return;
    }
  }
  updateTimer?.cancel();
  updateTimer = ElapsedTimer(const Duration(seconds: 10), updateData);
  // Proceed with some updates
}
```

## Usage

```dart
final timer = ElapsedTimer(const Duration(seconds: 5), () => print('All done'));
// Somewhere in the code:
final elapsed = timer.elapsed;
```

## Issues

Can be found [here](https://github.com/KabaDH/elapsed_timer/issues).
